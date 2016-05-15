// BCM2835 AUX = mini UART, 2 SPI masters
#include "rpi-aux.h"
#include "gpio.h"

static aux_t* auxController = (aux_t*)AUX_BASE;

aux_t* getAuxController(void)
{
	return auxController;
}

void initMUARTtx(void)
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
	auxController->MU_IER = 0;		//no interrupts
	auxController->MU_LCR = 3;		//8-bit mode
	auxController->MU_BAUD = 542;	//57600 baud
	auxController->MU_IIR = 0xC6;	//clear the FIFOs
	auxController->MU_CNTL = 3;		//TX & RX Enabled;
}

int initMUART(void)
{
	//int i;
/*	if (RXclear==0) {
		return 0;
	}
*/
	/** GPIO Settings **/
	getGPIOController()->TX_FSEL |= TX_FSELBIT;		//TX; alt 5
	getGPIOController()->RX_FSEL |= RX_FSELBIT;		//RX; alt 5


	/** TX pullup
	getGPIOController()->PUD = PUD_PULLUP;					//write to PUD
	for (i=0; i<150; i++);									//wait 150 clock cycles
	getGPIOController()->TX_PUDCLK = 1;						//write to PUDCLK1
	for (i=0; i<150; i++);									//wait 150 cycles
	getGPIOController()->PUD = 0;							//write to PUD to remove
	getGPIOController()->TX_PUDCLK = 0;						//write to PUDCLK to remove
	**/

	/** Aux MUART Settings **/
	auxController->ENABLES |= 1;	//mUART enabled
	auxController->MU_IIR = 2;		//rx interrupt enable
	auxController->MU_LCR = 1;		//8-bit mode
	auxController->MU_CNTL = 1;		//RX enabled, TX disabled
	auxController->MU_BAUD = 1084;	//57600 baud

	return 1;
}
/*
int RXclear(void)
{
	//use systimer.c-like routine? eg:
	// while (GetSystemTimer()->CLO - ts < WAIT_TIME) {
	//	  if RX line == 0
	//			return 0;
	// }
	// return 1;
}
*/