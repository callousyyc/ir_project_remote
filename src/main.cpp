#include "shim/Arduino.h"
#include <IRsend.h>
// #include <ir_Panasonic.h> // 包含格力空调协议头文件
#include <ir_Haier.h> // 包含海尔空调协议头文件
#include <zephyr/kernel.h>

// #include "IRsendNRF52.h"
// IRsendNRF52 irsend;

// 定义 GPIO 引脚号 (这里的数字仅用于 Shim 层 pinMode 占位，实际 PWM 在 driver
// 中处理)
const uint16_t kIrLed = 4;

// 实例化对象
IRsend irsend(kIrLed);
IRHaierAC ac(kIrLed); // 实例化松下空调对象

int main(void) {
  printk("Starting IR Remote for nRF52840...\n");

  // 初始化
  //   irsend.begin();
  ac.begin();

  // 设置空调参数
  printk("Setting up AC...\n");
  // ac.on();
  ac.setMode(kHaierAcCool);
  ac.setTemp(26);
  ac.setFan(kHaierAcFanLow);
  // ac.setSwingVertical(kHaierAcSwingVAuto);

  while (1) {
    printk("Sending IR Code: Cool 26C\n");

    // 发送！
    // ac.send() 内部会调用 irsend.sendRaw() 或 sendGeneric()
    // 最终会调用我们重写的 irsend.mark() / space()
    ac.send();

    k_sleep(K_SECONDS(5));
  }
  return 0;
}