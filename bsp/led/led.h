#ifndef _LED_H_
#define _LED_H_

#include "../../imx6ull/fsl_iomuxc.h"

#define LED_ON 1
#define LED_OFF 0

void led_init();

void led_switch(int);

#endif
