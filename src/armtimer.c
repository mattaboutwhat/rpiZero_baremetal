#include "armtimer.h"

static arm_timer_t* rpiArmTimer = (arm_timer_t*)ARMTIMER_BASE;

arm_timer_t* getArmTimer (void)
{
	return rpiArmTimer;
}

int ArmTimerIRQPend(void)
{
	return getArmTimer()->RawIRQ;
}