#include <zephyr/kernel.h>

#include <nrfx.h> // ⭐ 非常关键
#include <nrfx_ppi.h>
#include <nrfx_pwm.h>
#include <nrfx_timer.h>

#include "ir_hal.h"
#include <hal/nrf_gpio.h>

#define IR_PWM NRF_PWM0
#define IR_TIMER NRF_TIMER1
#define IR_GPIO_PIN 11 /* P0.13 */
/* 38kHz: 16MHz / 421 ≈ 38kHz */
#define PWM_CLK_HZ 16000000UL
#define IR_CARRIER_HZ 38000UL
#define PWM_COUNTERTOP (PWM_CLK_HZ / IR_CARRIER_HZ)
static nrfx_pwm_t pwm = NRFX_PWM_INSTANCE(0);
static nrfx_timer_t timer = NRFX_TIMER_INSTANCE(1);
static nrf_ppi_channel_t ppi_stop_ch;
/* PWM sequence: 固定 duty，不使用 sequence 播放包络 */
static nrf_pwm_values_common_t pwm_seq_val;
static nrf_pwm_sequence_t pwm_seq;
static struct k_sem timer_sem;

// 定义要使用的引脚 (P0.13)
#define TOGGLE_GPIO_PIN 13
// nRF52系列中，P0口引脚号就是实际的引脚序号

void gpio_toggle_init(void) {
  // 1. 配置引脚为输出模式
  // 注意：您必须使用 nrf_gpio_cfg_output，而不是 Zephyr 的 device API，
  // 因为您后续要使用 nrf_gpio_pin_toggle (一个直接的 HAL 宏)
  nrf_gpio_cfg_output(TOGGLE_GPIO_PIN);

  // 初始化为低电平（可选）
  nrf_gpio_pin_clear(TOGGLE_GPIO_PIN);
  // nrf_gpio_pin_set(TOGGLE_GPIO_PIN);
}
/* ---------------- TIMER ISR ---------------- */
static void timer_handler(nrf_timer_event_t event_type, void *p_context) {

  nrf_gpio_pin_toggle(TOGGLE_GPIO_PIN);
  if (event_type == NRF_TIMER_EVENT_COMPARE0) {
    // nrf_timer_task_trigger(IR_TIMER, NRF_TIMER_TASK_STOP);
    nrfx_timer_clear(&timer);
    k_sem_give(&timer_sem);
  }
}
/* ---------------- INIT ---------------- */
static void pwm_init(void) {
  // nrf_gpio_cfg_output(IR_GPIO_PIN);
  // nrfx_pwm_config_t cfg = {
  //     .output_pins =
  //         {
  //             IR_GPIO_PIN | NRFX_PWM_PIN_INVERTED,
  //             NRFX_PWM_PIN_NOT_USED,
  //             NRFX_PWM_PIN_NOT_USED,
  //             NRFX_PWM_PIN_NOT_USED,
  //         },
  //     .irq_priority = 7,
  //     .base_clock = NRF_PWM_CLK_16MHz,
  //     .count_mode = NRF_PWM_MODE_UP,
  //     .top_value = PWM_COUNTERTOP,
  //     .load_mode = NRF_PWM_LOAD_COMMON,
  //     .step_mode = NRF_PWM_STEP_AUTO,
  // };
  // nrfx_pwm_init(&pwm, &cfg, NULL, NULL);

  // nrfx_pwm_config_t cfg = {.output_pins =
  //                              {
  //                                  NRF_GPIO_PIN_MAP(1, IR_GPIO_PIN), // ch0
  //                                  NRF_PWM_PIN_NOT_CONNECTED,        // ch1
  //                                  NRF_PWM_PIN_NOT_CONNECTED,        // ch2
  //                                  NRF_PWM_PIN_NOT_CONNECTED         // ch3
  //                              },
  //                          .irq_priority =
  //                          NRFX_PWM_DEFAULT_CONFIG_IRQ_PRIORITY, .base_clock
  //                          = NRF_PWM_CLK_16MHz, .count_mode =
  //                          NRF_PWM_MODE_UP, .top_value = PWM_COUNTERTOP, //
  //                          16MHz / 38kHz ≈ 421 .load_mode =
  //                          PWM_DECODER_LOAD_Common, .step_mode =
  //                          NRF_PWM_STEP_AUTO};

  // nrfx_err_t err = nrfx_pwm_init(&pwm, &cfg, NULL, NULL);

#if defined(__ZEPHYR__)
  // IRQ_CONNECT(NRFX_IRQ_NUMBER_GET(NRF_PWM_INST_GET(0)), IRQ_PRIO_LOWEST,
  //             NRFX_PWM_INST_HANDLER_GET(0), 0, 0);
#endif

  nrfx_pwm_config_t config = NRFX_PWM_DEFAULT_CONFIG(
      NRF_GPIO_PIN_MAP(1, IR_GPIO_PIN), NRF_PWM_PIN_NOT_CONNECTED,
      NRF_PWM_PIN_NOT_CONNECTED, NRF_PWM_PIN_NOT_CONNECTED);
  config.top_value = PWM_COUNTERTOP;
  config.base_clock = NRF_PWM_CLK_16MHz;
  nrfx_err_t status = nrfx_pwm_init(&pwm, &config, NULL, &pwm);
  // NRFX_ASSERT(status == NRFX_SUCCESS);
  if (status != NRFX_SUCCESS) {
    // 处理错误，例如记录日志或进入安全状态
    printk("pwm_init status:0x%x\n", status);
    return;
  }

  /* 33% duty */
  pwm_seq_val = PWM_COUNTERTOP / 2;
  pwm_seq = (nrf_pwm_sequence_t){
      .values.p_common = &pwm_seq_val,
      .length = 1,
      .repeats = 0,
      .end_delay = 0,
  };

  nrfx_pwm_simple_playback(&pwm, &pwm_seq, 1, NRFX_PWM_FLAG_LOOP);
}
// static void timer_init(void) {
//   // nrfx_timer_config_t cfg = NRFX_TIMER_DEFAULT_CONFIG;

//   nrfx_timer_config_t cfg = {.frequency = NRF_TIMER_FREQ_1MHz,
//                              .mode = NRF_TIMER_MODE_TIMER,
//                              .bit_width = NRF_TIMER_BIT_WIDTH_32,
//                              .interrupt_priority =
//                                  NRFX_TIMER_DEFAULT_CONFIG_IRQ_PRIORITY,
//                              .p_context = NULL};
//   // cfg.frequency = NRF_TIMER_FREQ_1MHz;
//   // cfg.mode = NRF_TIMER_MODE_TIMER;
//   // cfg.bit_width = NRF_TIMER_BIT_WIDTH_32;
//   nrfx_timer_init(&timer, &cfg, timer_handler);
//   nrfx_timer_enable(&timer);
// }

static void timer_init(void) {
  nrfx_err_t status;

#if defined(__ZEPHYR__)
  IRQ_CONNECT(NRFX_IRQ_NUMBER_GET(NRF_TIMER_INST_GET(1)), IRQ_PRIO_LOWEST,
              NRFX_TIMER_INST_HANDLER_GET(1), 0, 0);
#endif
  // nrfx_timer_config_t cfg = {.frequency = NRF_TIMER_FREQ_1MHz,
  //                            .mode = NRF_TIMER_MODE_TIMER,
  //                            .bit_width = NRF_TIMER_BIT_WIDTH_32,
  //                            .interrupt_priority =
  //                                NRFX_TIMER_DEFAULT_CONFIG_IRQ_PRIORITY,
  //                            .p_context = NULL};

  // nrfx_timer_config_t cfg = NRFX_TIMER_DEFAULT_CONFIG(NRF_TIMER_FREQ_1MHz);
  // cfg.frequency = NRF_TIMER_FREQ_1MHz;

  // nrfx_timer_init(&timer, &cfg, timer_handler);

  // nrfx_err_t err = nrfx_timer_init(&timer, &cfg, timer_handler);
  // __ASSERT(err == NRFX_SUCCESS, "timer init failed");

  // nrfx_timer_t timer_t_inst = NRFX_TIMER_INSTANCE(TIMER_T_INST_IDX);
  uint32_t base_frequency = NRF_TIMER_BASE_FREQUENCY_GET(timer.p_reg);
  nrfx_timer_config_t config = NRFX_TIMER_DEFAULT_CONFIG(base_frequency);
  config.bit_width = NRF_TIMER_BIT_WIDTH_32;
  config.p_context = &timer;
  status = nrfx_timer_init(&timer, &config, timer_handler);
  // NRFX_ASSERT(status == NRFX_SUCCESS);
  if (status != NRFX_SUCCESS) {
    // 处理错误，例如记录日志或进入安全状态
    printk("timer_init status:0x%x\n", status);
    return;
  }

  // nrfx_timer_clear(&timer);
  nrfx_timer_enable(&timer);

  gpio_toggle_init();
}

static void ppi_init(void) {
  nrfx_ppi_channel_alloc(&ppi_stop_ch);
  uint32_t evt = nrfx_timer_event_address_get(&timer, NRF_TIMER_EVENT_COMPARE0);
  uint32_t task = nrfx_pwm_task_address_get(&pwm, NRF_PWM_TASK_STOP);
  nrfx_ppi_channel_assign(ppi_stop_ch, evt, task);
}
void ir_hw_init(void) {
  k_sem_init(&timer_sem, 0, 1);
  pwm_init();
  timer_init();
  ppi_init();
}

void ir_mark(uint32_t us) {
  k_sem_reset(&timer_sem);
  nrfx_timer_clear(&timer);

  uint32_t ticks = nrfx_timer_us_to_ticks(&timer, us);
  /* 设置定时器比较值 */
  nrfx_timer_compare(&timer, NRF_TIMER_CC_CHANNEL0, ticks, true);
  /* COMPARE → PWM STOP */
  nrfx_ppi_channel_enable(ppi_stop_ch);
  /* 立即启动载波 */
  nrfx_pwm_simple_playback(&pwm, &pwm_seq, 1, NRFX_PWM_FLAG_LOOP);
  nrfx_timer_resume(&timer);
  /* 等待硬件完成（非 busy wait） */
  k_sem_take(&timer_sem, K_FOREVER);
  nrfx_ppi_channel_disable(ppi_stop_ch);
}
void ir_space(uint32_t us) {
  k_sem_reset(&timer_sem);
  nrfx_pwm_stop(&pwm, false);
  nrfx_timer_clear(&timer);

  uint32_t ticks = nrfx_timer_us_to_ticks(&timer, us);
  /* 设置定时器比较值 */
  nrfx_timer_compare(&timer, NRF_TIMER_CC_CHANNEL0, ticks, true);
  nrfx_timer_resume(&timer);
  k_sem_take(&timer_sem, K_FOREVER);
}

void ir_set_carrier_freq(uint32_t hz, uint8_t duty_percent) {
  if (hz == 0 || duty_percent == 0 || duty_percent > 100) {
    return;
  }
  uint32_t new_top = PWM_CLK_HZ / (hz);
  uint32_t new_duty = (new_top * duty_percent) / 100UL;
  nrfx_pwm_stop(&pwm, true);
  /* 重新配置 PWM */
  nrfx_pwm_config_t cfg = {.output_pins =
                               {
                                   NRF_GPIO_PIN_MAP(1, IR_GPIO_PIN), // ch0
                                   NRF_PWM_PIN_NOT_CONNECTED,        // ch1
                                   NRF_PWM_PIN_NOT_CONNECTED,        // ch2
                                   NRF_PWM_PIN_NOT_CONNECTED         // ch3
                               },
                           .irq_priority = NRFX_PWM_DEFAULT_CONFIG_IRQ_PRIORITY,
                           .base_clock = NRF_PWM_CLK_16MHz,
                           .count_mode = NRF_PWM_MODE_UP,
                           .top_value = new_top, // 16MHz / 38kHz ≈ 421
                           .load_mode = PWM_DECODER_LOAD_Common,
                           .step_mode = NRF_PWM_STEP_AUTO};

  // nrfx_pwm_init(&pwm, &cfg, NULL, NULL);

  nrfx_err_t status = nrfx_pwm_init(&pwm, &cfg, NULL, NULL);
  // NRFX_ASSERT(status == NRFX_SUCCESS);
  if (status != NRFX_SUCCESS) {
    // 处理错误，例如记录日志或进入安全状态
    printk("pwm_init status:0x%x\n", status);
    return;
  }

  /* 33% duty */
  pwm_seq_val = new_duty;
  pwm_seq = (nrf_pwm_sequence_t){
      .values.p_common = &pwm_seq_val,
      .length = 1,
      .repeats = 0,
      .end_delay = 0,
  };
}
