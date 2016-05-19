/* RPi2 SD pin connections (each through 33ohm series resistor)
 * 		SD_CLK - GPIO48
 *		SD_CMD - GPIO49
 *		SD_DATA0 - GPIO50
 *		SD_DATA1 - GPIO51
 *		SD_DATA2 - GPIO52
 * 		SD_DATA3 - GPIO53
 *		SD_CARD_DET - GPIO47
 * 	^ All these GPIOs have ALT0: <internal>
 * Thus, it *seems* that we don't have to worry about GPIO
 * setup. We just use the module and go. 
 */

#ifndef RPI_EMMC_H
#define RPI_EMMC_H

#include <stdint.h>
#include "base.h"

#define EMMC_BASE 		(PERIPH_BASE + 0x300000)

typedef struct {							//offset from base
	volatile uint32_t ARG2;						//0x00
	volatile uint32_t BLKSIZECNT;				//0x04
	volatile uint32_t ARG1;						//0x08
	volatile uint32_t CMDTM;					//0x0C
	volatile uint32_t RESP0;					//0x10
	volatile uint32_t RESP1;					//0x14
	volatile uint32_t RESP2;					//0x18
	volatile uint32_t RESP3;					//0x1C
	volatile uint32_t DATA;						//0x20
	volatile uint32_t STATUS;					//0x24
	volatile uint32_t CONTROL0;					//0x28
	volatile uint32_t CONTROL1;					//0x2C
	volatile uint32_t INTERRUPT;				//0x30
	volatile uint32_t IRPT_MASK;				//0x34
	volatile uint32_t IRPT_EN;					//0x38
	volatile uint32_t CONTROL2;					//0x3C
	volatile uint32_t RESERVED0[(0x50-0x3c)/4 - 1];		//0x40 - 0x4C
	volatile uint32_t FORCE_IRPT;				//0x50
	volatile uint32_t RESERVED1[(0x70 - 0x50)/4 -1];	//0x54 - 0x6C
	volatile uint32_t BOOT_TIMEOUT;				//0x70
	volatile uint32_t DBG_SEL;					//0x74
	volatile uint32_t RESERVED2[(0x80 - 0x74)/4 - 1];	//0x78 - 0x7C
	volatile uint32_t EXRDFIFO_CFG;				//0x80
	volatile uint32_t EXRDFIFO_EN;				//0x84
	volatile uint32_t TUNE_STEP;				//0x88
	volatile uint32_t TUNE_STEPS_STD;			//0x8C
	volatile uint32_t TUNE_STEPS_DDR;			//0x90
	volatile uint32_t RESERVED3[(0xF0 - 0x90)/4 - 1]; 	//0x94 - 0xEC
	volatile uint32_t SPI_INT_SPT;				//0xF0
	volatile uint32_t RESERVED4[(0xFC - 0xF0)/4 - 1]; 	//0xF4 - 0xF8
	volatile uint32_t SLOTISR_VER;				//0xFC
} emmc_t;

extern emmc_t* getEMMCController(void);

#endif