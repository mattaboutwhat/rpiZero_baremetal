#include <string.h>

#include "base.h"
#include "gpio.h"
#include "systimer.h"
#include "armtimer.h"
#include "interrupts.h"
#include "rpi-aux.h"
#include "console.h"

extern void _enable_interrupts(void);

#define BAUDRATE 115200

void kernel_main(unsigned int r0, unsigned int r1, unsigned int atags)
{	
	//int i;
	// Configure STAT LED output and turn on 
	getGPIOController()->LED_FSEL |= (1 << LED_FSELBIT);
	getGPIOController()->LED_CLR   = (1 << LED_GPIOBIT);

	// Configure ARM timer 
	getArmTimer()->Load   = 0x800;
	getArmTimer()->Reload = 0x800;
	getArmTimer()->Control = MODE_32BIT | PRESCALE_256 | 
						 	 INT_EN     | TIM_EN;			//0xAA

	// Configure mUART   
	initMUART(BAUDRATE);

	// Enable interrupts 
	getIRQController()->EnableBasicIRQs = 1; 		//enable arm timer interrupts
	_enable_interrupts();

	debug_print();

	while(1) {
		printu("whatever");
		WaitMicroSeconds(500000);
	}
}