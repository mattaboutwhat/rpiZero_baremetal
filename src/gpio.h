#ifndef RPI_GPIO_H
#define RPI_GPIO_H
// gpio.h
#include <stdint.h>
#include "base.h"

#define GPIO_BASE 		(PERIPH_BASE + 0x200000UL)

//LED definitions: ACT LED on GPIO 47
#define LED_FSEL        FSEL4
#define LED_FSELBIT     21
#define LED_SET         SET1
#define LED_CLR         CLR1
#define LED_GPIOBIT     15

//GPIO Register Defines
#define GPIO_FSEL0		0 	//0x0000
#define GPIO_FSEL1      1
#define GPIO_FSEL2      2
#define GPIO_FSEL3      3
#define GPIO_FSEL4      4
#define GPIO_FSEL5      5

#define GPIO_SET0		7	//0x001C
#define GPIO_SET1   	8

#define GPIO_CLR0     	10 	//0x0028
#define GPIO_CLR1     	11

#define GPIO_LEV0     	13	//0x0034
#define GPIO_LEV1     	14

#define GPIO_EDS0     	16	//0x0040
#define GPIO_EDS1     	17

#define GPIO_REN0     	19	//0x004C
#define GPIO_REN1     	20

#define GPIO_FEN0     	22	//0x0058
#define GPIO_FEN1     	23

#define GPIO_HEN0     	25	//0x0064
#define GPIO_HEN1     	26

#define GPIO_LEN0     	28	//0x0070
#define GPIO_LEN1     	29

#define GPIO_AREN0    	31	//0x007C
#define GPIO_AREN1    	32

#define GPIO_AFEN0    	34	//0x0088
#define GPIO_AFEN1    	35

#define GPIO_PUD      	37	//0x0094
#define GPIO_PUDCLK0  	38
#define GPIO_PUDCLK1  	39

typedef struct {				//Offset from base:
	volatile uint32_t FSEL0;		//0x00
	volatile uint32_t FSEL1;		//0x04
	volatile uint32_t FSEL2;		//0x08
	volatile uint32_t FSEL3;		//0x0C
	volatile uint32_t FSEL4;		//0x10
	volatile uint32_t FSEL5;		//0x14
	volatile uint32_t Reserved0;	//0x18
	volatile uint32_t SET0;			//0x1C
	volatile uint32_t SET1;			//0x20
	volatile uint32_t Reserved1;	//0x24
	volatile uint32_t CLR0;			//0x28
	volatile uint32_t CLR1;			//0x2C
	volatile uint32_t Reserved2;	//0x30
	volatile uint32_t LEV0;			//0x34
	volatile uint32_t LEV1;			//0x38
	volatile uint32_t Reserved3;	//0x3C
	volatile uint32_t EDS0;			//0x40
	volatile uint32_t EDS1;			//0x44
	volatile uint32_t Reserved4;	//0x48
	volatile uint32_t REN0; 		//0x4C
	volatile uint32_t REN1; 		//0x50
	volatile uint32_t Reserved5;	//0x54
	volatile uint32_t FEN0; 		//0x58
	volatile uint32_t FEN1; 		//0x5C
	volatile uint32_t Reserved6;	//0x60
	volatile uint32_t HEN0;			//0x64
	volatile uint32_t HEN1;			//0x68
	volatile uint32_t Reserved7;	//0x6C
	volatile uint32_t LEN0;			//0x70
	volatile uint32_t LEN1;			//0x74
	volatile uint32_t Reserved8;	//0x78
	volatile uint32_t AREN0;		//0x7C
	volatile uint32_t AREN1;		//0x80
	volatile uint32_t Reserved9;	//0x84
	volatile uint32_t AFEN0;		//0x88
	volatile uint32_t AFEN1;		//0x8C
	volatile uint32_t Reserved10;	//0x90
	volatile uint32_t PUD;			//0x94
	volatile uint32_t PUDCLK0;		//0x98
	volatile uint32_t PUDCLK1;		//0x9C
	volatile uint32_t Reserved11;	//0xA0
	volatile uint32_t Reserved12;	//0xA4
	volatile uint32_t Reserved13;	//0xA8
	volatile uint32_t Reserved14;	//0xAC
	volatile uint8_t  Test;			//0xB0
	} gpio_controller_t;

extern gpio_controller_t* getGPIOController(void);

#endif