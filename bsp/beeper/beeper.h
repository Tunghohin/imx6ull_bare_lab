#ifndef _BEEPER_H_
#define _BEEPER_H_

#define BEEPER_ON 1
#define BEEPER_OFF 0

#include "../../imx6ull/fsl_iomuxc.h"

void beeper_init();

void beeper_switch(int);

#endif
