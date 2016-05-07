#include <stdlib.h>

#include "base.h"
#include "gpio.h"


void kernel_main(unsigned int r0, unsigned int r1, unsigned int atags)
{
	//led GPIO output config
	getGPIOController()->LED_FSEL |= (1 << LED_FSELBIT);

	//led OFF
	getGPIOController()->LED_SET = (1 << LED_GPIOBIT);

	while(1) {
		for (int i=0; i<500000; i++);
		getGPIOController()->LED_CLR = (1 << LED_GPIOBIT);
		for (int i=0; i<500000; i++);
		getGPIOController()->LED_SET = (1 << LED_GPIOBIT);
	}
}