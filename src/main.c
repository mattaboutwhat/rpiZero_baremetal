#include <stdlib.h>

#include "base.h"
#include "gpio.h"
#include "systimer.h"
#include "armtimer.h"
#include "interrupts.h"
#include "rpi-aux.h"

extern void _enable_interrupts(void);

void kernel_main(unsigned int r0, unsigned int r1, unsigned int atags)
{	
	int led = 1;
	/** Configure STAT LED output and turn on **/
	getGPIOController()->LED_FSEL |= (1 << LED_FSELBIT);
	getGPIOController()->LED_CLR   = (1 << LED_GPIOBIT);

	/** Configure ARM timer **/
	//getArmTimer()->Load   = 0x800;
	//getArmTimer()->Reload = 0x800;
	//getArmTimer()->Control = MODE_32BIT | PRESCALE_256 | 
	//					 	 INT_EN     | TIM_EN;			//0xAA

	/** Configure mUART **/  
	//initMUART();
	initMUARTtx();
	//getGPIOController()->LED_CLR   = (1 << LED_GPIOBIT);

	/** Enable interrupts **/
	//getIRQController()->EnableBasicIRQs = 1; 		//enable arm timer interrupts
	//getIRQController()->EnableIRQs1 |= (1<<29);		//enable "aux_int" interrupts
	//_enable_interrupts();

	while(1) {
	
		while ( (getAuxController()->MU_LSR & 0x01) == 0 );		//data ready
		//while ( (getAuxController()->MU_LSR & 0x20) == 0 );		//TX empty
		getAuxController()->MU_IO = getAuxController()->MU_IO;

		if (led){
			getGPIOController()->LED_SET = (1<<LED_GPIOBIT);
			led=0;
		}
		else {
			getGPIOController()->LED_CLR = (1<<LED_GPIOBIT);
			led=1;
		}
	}
}