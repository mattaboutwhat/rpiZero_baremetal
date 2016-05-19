#include "emmc.h"

static emmc_t* emmcController = (emmc_t*)EMMC_BASE;

emmc_t* getEMMCController(void)
{
	return emmcController;
}