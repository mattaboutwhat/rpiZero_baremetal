#include <stdint.h>
#include "systimer.h"

static systimer_t* rpiSystemTimer = (systimer_t*)SYSTIMER_BASE;

systimer_t* GetSystemTimer(void)
{
    return rpiSystemTimer;
}

void WaitMicroSeconds( uint32_t us)
{
    volatile uint32_t ts = rpiSystemTimer->CLO;

    while( (rpiSystemTimer->CLO - ts ) < us )
    {
        //do nothing
    }
}
