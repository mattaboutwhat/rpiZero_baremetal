//#include <stdlib.h>

#include "base.h"
#include "gpio.h"
//#include "systimer.h"
#include "armtimer.h"
#include "interrupts.h"

extern void _enable_interrupts(void);

void kernel_main(unsigned int r0, unsigned int r1, unsigned int atags)
{		
	/** Configure LED GPIO output and turn off **/
	getGPIOController()->LED_FSEL |= (1 << LED_FSELBIT);
	getGPIOController()->LED_SET = (1<<LED_GPIOBIT);

	/** Configure ARM timer **/
	getArmTimer()->Load = 0x800;
	getArmTimer()->Reload = 0x800;
	getArmTimer()->Control = MODE_32BIT | PRESCALE_256 | 
							 INT_EN     | TIM_EN;			//0xAA

	/** Enable interrupts **/
	getIRQController()->EnableBasicIRQs = 1;
	_enable_interrupts();

	while(1) {
		;	
	}
}