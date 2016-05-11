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