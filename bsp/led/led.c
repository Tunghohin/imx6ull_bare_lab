#include "led.h"

void led_init() {
    IOMUXC_SetPinMux(IOMUXC_GPIO1_IO03_GPIO1_IO03, 0);
    IOMUXC_SetPinConfig(IOMUXC_GPIO1_IO03_GPIO1_IO03, 0x10b0);
    GPIO1->GDIR = 0x00000008;
}

void led_switch(int status) {
    if (status == LED_ON) {
        GPIO1->DR &= ~(1 << 3);
    } else if (status == LED_OFF) {
        GPIO1->DR |= 1 << 3;
    }
}
