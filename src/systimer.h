// systimer.h
// BCM2835 System timer definitions

#ifndef SYSTIMER_H
#define SYSTIMER_H

#include <stdint.h>

#define SYSTIMER_BASE   0x20003000

typedef struct {
    volatile uint32_t CS;
    volatile uint32_t CLO;
    volatile uint32_t CHI;
    volatile uint32_t C0;
    volatile uint32_t C1;
    volatile uint32_t C2;
    volatile uint32_t C3;
    } systimer_t;

extern systimer_t* GetSystemTimer(void);
void WaitMicroSeconds( uint32_t );

#endif
