#include "armtimer.h"
#include "gpio.h"
#include "interrupts.h"
//#include "rpi-aux.h"
//#include "uart.h"

static irq_controller_t* rpiIRQController = (irq_controller_t*)IRQ_BASE;

irq_controller_t* getIRQController(void)
{
	return rpiIRQController;
}

void __attribute__((interrupt("IRQ"))) interrupt_vector(void)
{
	static int lit = 0;

	//toggle LEDS
	if (lit) 
	{
		getGPIOController()->LED_SET = (1<<LED_GPIOBIT);		//turn off
		lit = 0;
	}
	else 
	{
		getGPIOController()->LED_CLR = (1<<LED_GPIOBIT);		//turn on
		lit = 1;
	}

	getArmTimer()->IRQClear = 1;

}

void __attribute__((interrupt("ABORT"))) reset_vector(void)
{

}

/**
	@brief The undefined instruction interrupt handler

	If an undefined intstruction is encountered, the CPU will start
	executing this function. Just trap here as a debug solution.
*/
void __attribute__((interrupt("UNDEF"))) undefined_instruction_vector(void)
{
	while( 1 )
	{
		/* Do Nothing! */
	}
}


/**
	@brief The supervisor call interrupt handler

	The CPU will start executing this function. Just trap here as a debug
	solution.
*/
void __attribute__((interrupt("SWI"))) software_interrupt_vector(void)
{
	while( 1 )
	{
		/* Do Nothing! */
	}
}


/**
	@brief The prefetch abort interrupt handler

	The CPU will start executing this function. Just trap here as a debug
	solution.
*/
void __attribute__((interrupt("ABORT"))) prefetch_abort_vector(void)
{

}


/**
	@brief The Data Abort interrupt handler

	The CPU will start executing this function. Just trap here as a debug
	solution.
*/
void __attribute__((interrupt("ABORT"))) data_abort_vector(void)
{

}

/**
	@brief The FIQ Interrupt Handler

	The FIQ handler can only be allocated to one interrupt source. The FIQ has
	a full CPU shadow register set. Upon entry to this function the CPU
	switches to the shadow register set so that there is no need to save
	registers before using them in the interrupt.

	In C you can't see the difference between the IRQ and the FIQ interrupt
	handlers except for the FIQ knowing it's source of interrupt as there can
	only be one source, but the prologue and epilogue code is quite different.
	It's much faster on the FIQ interrupt handler.

	The prologue is the code that the compiler inserts at the start of the
	function, if you like, think of the opening curly brace of the function as
	being the prologue code. For the FIQ interrupt handler this is nearly
	empty because the CPU has switched to a fresh set of registers, there's
	nothing we need to save.

	The epilogue is the code that the compiler inserts at the end of the
	function, if you like, think of the closing curly brace of the function as
	being the epilogue code. For the FIQ interrupt handler this is nearly
	empty because the CPU has switched to a fresh set of registers and so has
	not altered the main set of registers.
*/
void __attribute__((interrupt("FIQ"))) fast_interrupt_vector(void)
{

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
