#include <stdint.h>
#include "gpio.h"

static gpio_controller_t* gpioController = (gpio_controller_t*)GPIO_BASE;

gpio_controller_t* getGPIOController( void )
{
    return gpioController;
}