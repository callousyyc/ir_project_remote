// #include "IRsendNRF52.h"
// IRsendNRF52::IRsendNRF52(uint16_t ir_pin)
//     : IRsend(ir_pin) // ir_pin 对 NRF 实际无意义，仅满足基类
// {}
// // void IRsendNRF52::begin() override {
// //   /* 初始化 NRF 硬件 IR 后端 */
// //   ir_hw_init();
// // }
// void IRsendNRF52::enableIROut(uint32_t freq) {
//   /*
//    * IRremote 协议层可能会多次调用 enableIROut()
//    * 在 NRF 上 PWM 已固定为 38kHz
//    */
//   (void)freq;
// }
// void IRsendNRF52::mark(uint32_t usec) { ir_mark(usec); }
// void IRsendNRF52::space(uint32_t usec) { ir_space(usec); }
