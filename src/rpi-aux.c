#include "rpi-aux.h"
#include "gpio.h"

#define SYSCLK		250000000

static aux_t* auxController = (aux_t*)AUX_BASE;

aux_t* getAuxController(void)
{
	return auxController;
}

void initMUART(int baud)
{
	int i, baudreg;

	/** Pick baudreg **/
	switch(baud) {
		case 57600:
			baudreg=542;
			break;
		case 115200:
			baudreg=270;
			break;
	}

	/** GPIO Settings **/
	getGPIOController()->TX_FSEL &= ~TX_FSELMASK;
	getGPIOController()->TX_FSEL |=  TX_FSELBIT;		//TX on GPIO14 alt5
	getGPIOController()->RX_FSEL &= ~RX_FSELMASK;
	getGPIOController()->RX_FSEL |=  RX_FSELBIT;		//RX on GPIO15 alt5

	/** TX - Disable Pullup/down **/
	getGPIOController()->TX_PUD = PUD_PULLUP;				//write to PUD
	for (i=0; i<150; i++);									//wait 150 clock cycles
	getGPIOController()->TX_PUDCLK = (1 << TX_PUDCLKBIT);	//write to PUDCLK1
	for (i=0; i<150; i++);									//wait 150 cycles
	getGPIOController()->TX_PUDCLK = 0;						//write to PUDCLK to remove
	getGPIOController()->TX_PUD = 0;						//write to PUD to remove

	/** Aux MUART Settings **/
	auxController->ENABLES |= 1;			//mUART en
	auxController->MU_IER   = 0;			//No MUART interrupts
	auxController->MU_LCR   = 3;			//8-bit mode (See errata)
	auxController->MU_BAUD  = baudreg;		//57600 baud @ 250MHz
	auxController->MU_IIR   = 0xC6;			//clear the FIFOs
	auxController->MU_CNTL  = 3;			//TX & RX Enabled;
}

//void MUARTwrite(char b)
void MUARTwrite(char b)
{
	while ( (getAuxController()->MU_LSR & 0x20) == 0 );
	getAuxController()->MU_IO = b ;
}

void printu(char* ptr)
{
	static int lit=1;

	while (*ptr) {
		MUARTwrite(*ptr++);
	}

	if (lit) {
		getGPIOController()->LED_SET   = (1 << LED_GPIOBIT);
		lit=0;
	}
	else {
		getGPIOController()->LED_CLR   = (1 << LED_GPIOBIT);
		lit=1;
	}
}