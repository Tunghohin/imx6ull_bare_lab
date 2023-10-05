#include "../bsp/beeper/beeper.h"
#include "../bsp/clk/enable_clk.h"
#include "../bsp/delay/delay.h"
#include "../bsp/led/led.h"
#include "../imx6ull/fsl_iomuxc.h"

__attribute__((noreturn)) int main() {
    enable_clk();
    led_init();
    beeper_init();

    while (1) {
        led_switch(LED_ON);
        beeper_switch(BEEPER_ON);
        delay(500);
        led_switch(LED_OFF);
        beeper_switch(BEEPER_OFF);
        delay(500);
    }
}
