// BCM2835 AUX = mini UART, 2 SPI masters
#include "rpi-aux.h"
#include "gpio.h"

static aux_t* auxController = (aux_t*)AUX_BASE;

aux_t* getAuxController(void)
{
	return auxController;
}

void initMUART(void)
{
	int i; 

	/** GPIO Settings **/
	getGPIOController()->TX_FSEL &= ~TX_FSELMASK;
	getGPIOController()->TX_FSEL |=  TX_FSELBIT;		//TX on GPIO14 alt5
	getGPIOController()->RX_FSEL &= ~RX_FSELMASK;
	getGPIOController()->RX_FSEL |=  RX_FSELBIT;		//RX on GPIO15 alt5

	/** TX - Disable Pullup/down **/
	getGPIOController()->TX_PUD = PUD_PULLUP;						//write to PUD
	for (i=0; i<150; i++);									//wait 150 clock cycles
	getGPIOController()->TX_PUDCLK = (1 << TX_PUDCLKBIT);	//write to PUDCLK1
	for (i=0; i<150; i++);									//wait 150 cycles
	getGPIOController()->TX_PUDCLK = 0;						//write to PUDCLK to remove
	getGPIOController()->TX_PUD = 0;						//write to PUD to remove

	/** Aux MUART Settings **/
	auxController->ENABLES |= 1;	//mUART en
	auxController->MU_IER = 1;		//RX interrupts (See errata)
	auxController->MU_LCR = 3;		//8-bit mode
	auxController->MU_BAUD = 542;	//57600 baud
	auxController->MU_IIR = 0xC6;	//clear the FIFOs
	auxController->MU_CNTL = 3;		//TX & RX Enabled;
}
