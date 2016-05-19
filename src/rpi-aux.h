#ifndef RPI_AUX
#define RPI_AUX

#include <stdint.h>
#include "base.h"

#define AUX_BASE 		(PERIPH_BASE + 0x215000)

typedef struct {						//offset from AUX_BASE
	volatile uint32_t IRQ;				//0x00
	volatile uint32_t ENABLES;			//0x04
	/** Memory break **/			
	volatile uint32_t RESERVED_00;		//0x08
	volatile uint32_t RESERVED_01;		//0x0C
	volatile uint32_t RESERVED_02;		//0x10
	volatile uint32_t RESERVED_03;		//0x14
	volatile uint32_t RESERVED_04;		//0x18
	volatile uint32_t RESERVED_05;		//0x1C
	volatile uint32_t RESERVED_06;		//0x20
	volatile uint32_t RESERVED_07;		//0x24
	volatile uint32_t RESERVED_08;		//0x28
	volatile uint32_t RESERVED_09;		//0x2C
	volatile uint32_t RESERVED_10;		//0x30
	volatile uint32_t RESERVED_11;		//0x34
	volatile uint32_t RESERVED_12;		//0x38
	volatile uint32_t RESERVED_13;		//0x3C
	/** Mini UART Registers **/
	volatile uint32_t MU_IO;			//0x40
	volatile uint32_t MU_IER;			//0x44
	volatile uint32_t MU_IIR;			//0x48
	volatile uint32_t MU_LCR;			//0x4C
	volatile uint32_t MU_MCR;			//0x50
	volatile uint32_t MU_LSR;			//0x54
	volatile uint32_t MU_MSR;			//0x58
	volatile uint32_t MU_SCRATCH;		//0x5C
	volatile uint32_t MU_CNTL;			//0x60
	volatile uint32_t MU_STAT;			//0x64
	volatile uint32_t MU_BAUD;			//0x68
	/** Memory break **/
	volatile uint32_t RESERVED_14;		//0x6C
	volatile uint32_t RESERVED_15;		//0x70
	volatile uint32_t RESERVED_16;		//0x74
	volatile uint32_t RESERVED_17;		//0x78
	volatile uint32_t RESERVED_18;		//0x7C
	/** SPI0 Registers **/
	volatile uint32_t SPI0_CNTL0;		//0x80
	volatile uint32_t SPI0_CNTL1;		//0x84
	volatile uint32_t SPI0_STAT;		//0x88
	volatile uint32_t RESERVED_19;		//0x8C
	volatile uint32_t SPI0_IO;			//0x90
	volatile uint32_t SPI0_PEEK;		//0x94
	/** Memory break **/
	volatile uint32_t RESERVED_20;		//0x98
	volatile uint32_t RESERVED_21;		//0x9C
	volatile uint32_t RESERVED_22;		//0xA0
	volatile uint32_t RESERVED_23;		//0xA4
	volatile uint32_t RESERVED_24;		//0xA8
	volatile uint32_t RESERVED_25;		//0xAC
	volatile uint32_t RESERVED_26;		//0xB0
	volatile uint32_t RESERVED_27;		//0xB4
	volatile uint32_t RESERVED_28;		//0xB8
	volatile uint32_t RESERVED_29;		//0xBC
	/** SPI1 Registers **/
	volatile uint32_t SPI1_CNTL0;		//0xC0
	volatile uint32_t SPI1_CNTL1;		//0xC4
	volatile uint32_t SPI1_STAT;		//0xC8
	volatile uint32_t RESERVED_30;		//0xCC
	volatile uint32_t SPI1_IO;			//0xD0
	volatile uint32_t SPI1_PEEK;		//0xD4
} aux_t;

extern aux_t* getAuxController(void);
extern void   initMUART(int);
void MUARTwrite(char);
void printu(char*);

#endif