#include "beeper.h"

void beeper_init() {
    IOMUXC_SetPinMux(IOMUXC_SNVS_SNVS_TAMPER1_GPIO5_IO01, 0);
    IOMUXC_SetPinConfig(IOMUXC_SNVS_SNVS_TAMPER1_GPIO5_IO01, 0x10b0);

    GPIO5->GDIR |= (1 << 1);
    GPIO5->DR |= (1 << 1);

    return;
}

void beeper_switch(int status) {
    if (status == BEEPER_ON) {
        GPIO5->DR &= ~(1 << 1);
    } else if (status == BEEPER_OFF) {
        GPIO5->DR |= (1 << 1);
    };
}
