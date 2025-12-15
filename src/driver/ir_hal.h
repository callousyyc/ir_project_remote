#pragma once
#include <stdint.h>
void ir_hw_init(void);
/* 直接替换 IRremote 的接口 */
void ir_mark(uint32_t us);
void ir_space(uint32_t us);
void ir_set_carrier_freq(uint32_t hz, uint8_t duty_percent);