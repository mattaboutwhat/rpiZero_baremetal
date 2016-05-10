//#include <stdlib.h>

#include "base.h"
#include "gpio.h"
#include "systimer.h"
//#include "armtimer.h"
//#include "interrupts.h"

extern void _enable_interrupts(void);

void kernel_main(unsigned int r0, unsigned int r1, unsigned int atags)
{		
	/** Configure LED GPIO output and turn on **/
	getGPIOController()->LED_FSEL |= (1 << LED_FSELBIT);
	getGPIOController()->LED_CLR = (1<<LED_GPIOBIT);

	while(1) {
		WaitMicroSeconds(500000);
		getGPIOController()->LED_SET = (1<<LED_GPIOBIT);
		WaitMicroSeconds(500000);
		getGPIOController()->LED_CLR = (1<<LED_GPIOBIT);		
	}
}