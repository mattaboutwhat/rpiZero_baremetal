#ifndef RPI_INTERRUPTS_H
#define RPI_INTERRUPTS_H

#include <stdint.h>
#include "base.h"
#include "gpio.h"

#define IRQ_BASE	(PERIPH_BASE + 0xB200UL)

//defines for register Enable_Basic_IRQs
#define RPI_BASIC_ARM_TIMER_IRQ         (1 << 0)
#define RPI_BASIC_ARM_MAILBOX_IRQ       (1 << 1)
#define RPI_BASIC_ARM_DOORBELL_0_IRQ    (1 << 2)
#define RPI_BASIC_ARM_DOORBELL_1_IRQ    (1 << 3)
#define RPI_BASIC_GPU_0_HALTED_IRQ      (1 << 4)
#define RPI_BASIC_GPU_1_HALTED_IRQ      (1 << 5)
#define RPI_BASIC_ACCESS_ERROR_1_IRQ    (1 << 6)
#define RPI_BASIC_ACCESS_ERROR_0_IRQ    (1 << 7)

typedef struct {
    volatile uint32_t IRQBasicPending;
    volatile uint32_t IRQPending1;
    volatile uint32_t IRQPending2;
    volatile uint32_t FIQControl;
    volatile uint32_t EnableIRQs1;
    volatile uint32_t EnableIRQs2;
    volatile uint32_t EnableBasicIRQs;
    volatile uint32_t DisableIRQs1;
    volatile uint32_t DisableIRQs2;
    volatile uint32_t DisableBasicIRQs;
    } irq_controller_t;

extern irq_controller_t* getIRQController( void );
void flashLED(void);

#endif