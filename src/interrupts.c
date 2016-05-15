#include "interrupts.h"
#include "armtimer.h"
#include "gpio.h"
//.#include "rpi-aux.h"

static irq_controller_t* rpiIRQController = (irq_controller_t*)IRQ_BASE;

irq_controller_t* getIRQController(void)
{
	return rpiIRQController;
}

/** INTERRUPT SERVICE ROUTINES **/

void __attribute__((interrupt("IRQ"))) interrupt_vector(void)
{
	static int lit=0;

	if (lit){
		getGPIOController()->LED_SET = (1<<LED_GPIOBIT);
		lit=0;
	}
	else {
		getGPIOController()->LED_CLR = (1<<LED_GPIOBIT);
		lit=1;
	}

	getArmTimer()->IRQClear = 1;
}

void __attribute__((interrupt("ABORT"))) reset_vector(void)
{
	flashLED();
}

void __attribute__((interrupt("UNDEF"))) undefined_instruction_vector(void)
{
	flashLED();
}

void __attribute__((interrupt("SWI"))) software_interrupt_vector(void)
{
	flashLED();
}

void __attribute__((interrupt("ABORT"))) prefetch_abort_vector(void)
{
	flashLED();
}

void __attribute__((interrupt("ABORT"))) data_abort_vector(void)
{
	flashLED();
}

void __attribute__((interrupt("FIQ"))) fast_interrupt_vector(void)
{
	flashLED();
}

/** Error Code **/

void flashLED(void)
{
	unsigned int i, j;
	getIRQController()->EnableBasicIRQs = 0;

	while (1) {
		for (i=0; i<10; i++) {
			for (j=0; j<400000; j++);
			getGPIOController()->LED_CLR = (1<<LED_GPIOBIT);
			for (j=0; j<400000; j++);
			getGPIOController()->LED_SET = (1<<LED_GPIOBIT);
		}
		for (i=0; i<1400000; i++);
	}
}


// Old code

/*
	//check for aux uart rx interrupt
	if ( getAuxController()->AUX_IRQ & 0x00000001 )  {

		//disable aux interrupt (to clear)
		rpiIRQController->Disable_IRQs_1 |= (1<<29);

		//get fill level of RX FIFO [19:16]
		uartFill  = getMUARTController()->MU_STAT_REG;
		uartFill  = uartFill>>16;
		uartFill &= 0x0000000F;

		//copy RX bytes to outbute()
		while (--uartFill) {
			outbyte ((char)(getMUARTController()->MU_IO_REG & 0x000000FF));
		}

		//re-enable aux interrupt
		rpiIRQController->Enable_IRQs_1 |= (1<<29);
	}


	//check for ARM timer interrupt
	else if (getArmTimer()->RAWIRQ) {

		getArmTimer()->IRQClear = 1;

		if (lit)
		{
			getGPIOController()->OutSet1 = (1<<LED_GPIOBIT);		//turn LED off
			lit = 0;
			if (count == 5) {
				//getIrqController()->Disable_Basic_IRQs = RPI_BASIC_ARM_TIMER_IRQ;
				getArmTimer()->Control &= (uint32_t)~RPI_ARMTIMER_CTRL_ENABLE; 
			}
		}
		else
		{
			getGPIOController()->OutClear1 = (1<<LED_GPIOBIT);		//turn LED on
			lit = 1;
			count++;
		}
	}
*/
