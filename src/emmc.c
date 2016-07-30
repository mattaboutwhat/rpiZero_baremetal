#include "emmc.h"
#include "rpi-aux.h"

static emmc_t* emmcController = (emmc_t*)EMMC_BASE;

emmc_t* getEMMCController(void)
{
	return emmcController;
}

//int initSD(void)
//{
//Configure peripheral:

//Configure SDCard:
	//CMD0 (reset)
	//CMD8 
	//ACMD41
	//CMD11 if necessary
	//CMD2
	//CMD3 (to stand-by-state)
//}

int sdSendCommand( unsigned int commandNum, unsigned int arg )
{
	EMMCCommand currentCommand = sdCommandTable[commandNum];
	printu(currentCommand.name);

	return 0;
} 