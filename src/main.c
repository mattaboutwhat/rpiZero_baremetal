#include <stdlib.h>

#include "base.h"
#include "gpio.h"


void kernel_main(unsigned int r0, unsigned int r1, unsigned int atags)
{
	//led GPIO output config
	getGPIOController()->LED_FSEL |= (1 << LED_FSELBIT);

	//led ON
	getGPIOController()->LED_CLR = (1 << LED_GPIOBIT);

	while(1) {
		;
	}
}