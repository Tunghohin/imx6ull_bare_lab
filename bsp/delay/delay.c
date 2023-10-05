#include "delay.h"

void delay_short() {
    uint16_t dur = 0x7ff;
    while (dur--) {
    }
}

void delay(uint32_t n) {
    while (n--) {
        delay_short();
    }
}
