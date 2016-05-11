#ifndef ARM_TIMER_H
#define ARM_TIMER_H

#include <stdint.h>
#include "base.h"

#define ARMTIMER_BASE 		(PERIPH_BASE + 0xb400)

/** Control Reg, 0x7e00b408 **/
#define MODE_32BIT 		(1 << 1)
#define PRESCALE_1		(3 << 2)
#define PRESCLAE_16		(1 << 2)
#define PRESCALE_256	(2 << 2)
#define INT_EN			(1 << 5)
#define TIM_EN			(1 << 7)
#define HALT_IN_DEBUG	(1 << 8)
#define FRC_EN			(1 << 9)


/** Raw IRQ Reg; 0x7e00b410; read only **/
//#define ARMTIMER_IRQ_PEND() do{getArmTimer()->RAWIRQ & 1;} while(0);

typedef struct {
	volatile uint32_t Load;
	volatile uint32_t Value;
	volatile uint32_t Control;
	volatile uint32_t IRQClear;
	volatile uint32_t RawIRQ;
	volatile uint32_t MaskedIRQ;
	volatile uint32_t Reload;
	volatile uint32_t PreDivider;
	volatile uint32_t FreeRunningCounter;
} arm_timer_t;

extern arm_timer_t* getArmTimer(void);
extern int ArmTimerIRQPend(void);


#endif