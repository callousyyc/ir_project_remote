// #pragma once
// #include "IRsend.h" // IRremoteESP8266 原始头文件
// #include <stdint.h>

// extern "C" {
// #include "ir_hal.h" // 你前面实现的 HAL
// }
// class IRsendNRF52 : public IRsend {
// public:
//   explicit IRsendNRF52(uint16_t ir_pin = 0);
//   void begin() override;

// protected:
//   /* 关键：覆盖 mark / space */
//   void mark(uint32_t usec) override;
//   void space(uint32_t usec) override;
//   /* 屏蔽 ESP 平台特有行为 */
//   void enableIROut(uint32_t freq) override;
// };
