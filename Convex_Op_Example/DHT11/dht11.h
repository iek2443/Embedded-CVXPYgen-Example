/**
 ******************************************************************************
 * @file           : dht11.h
 * @brief          : Header file for DHT11 temperature and humidity sensor driver
 ******************************************************************************
 * @attention
 *
 * This file provides function declarations and macros to interface the DHT11
 * digital temperature and humidity sensor using GPIO and timing functions.
 * The corresponding implementation can be found in dht11.c.
 *
 * Created on: Oct 16, 2025
 * Author: iek
 *
 ******************************************************************************
 */

#ifndef DHT11_H_
#define DHT11_H_

/**
 * @brief  HAL library include for STM32 platform.
 *
 * @note   The user must include the correct HAL header file based on their MCU family.
 *         For example:
 *         @code
 *         #include "stm32g0xx_hal.h"   // For STM32G0 series
 *         #include "stm32f4xx_hal.h"   // For STM32F4 series
 *         #include "stm32l4xx_hal.h"   // For STM32L4 series
 *         @endcode
 *         Make sure to match this include with your STM32 device.
 */
#include "stm32f4xx_hal.h"

/**
 * @brief  GPIO and timer configuration for DHT11 sensor.
 *
 * @note   Modify these definitions according to your hardware setup.
 */
#define DHT11_Pin 					GPIO_PIN_1
#define DHT11_GPIO_Port 			GPIOA
#define TIM_DHT11 					TIM6

/**
 * @brief  Logical state definitions for DHT11 pin control.
 *
 * @note   Modify these values according to your system logic level
 *         or GPIO handling method if necessary.
 */
#define DHT11_Pin_Reset 			0
#define DHT11_Pin_Set 				1
#define DHT11_Pin_Read_Reset 		0
#define DHT11_Pin_Read_Set 			1


/**
 * @brief  Status codes for DHT11 measurement results.
 *
 * @note   Use these enumeration values to check whether a measurement
 *         operation from the DHT11 sensor was successful or failed.
 */
typedef enum {

	DHT11_FAILD, DHT11_SUCCESS

} DHT11_Measurement_t;


/**
 * @brief  Data structure for storing DHT11 sensor readings.
 *
 * @note   This structure holds the temperature and humidity values
 *         read from the DHT11 sensor, along with the measurement status.
 */
typedef struct {

	uint16_t Humidity;
	uint16_t Temperature;

	DHT11_Measurement_t Measurement;

} DHT11_t;


/**
 * @brief  Configure the specified GPIO pin as output.
 *
 * @param  GPIOx     Pointer to the GPIO port (e.g., GPIOA, GPIOB).
 * @param  GPIO_Pin  Specifies the GPIO pin number.
 *
 * @note   Used to drive the DHT11 data line during the start signal.
 */
static void DHT11_Set_Pin_Output(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin);


/**
 * @brief  Configure the specified GPIO pin as input.
 *
 * @param  GPIOx     Pointer to the GPIO port (e.g., GPIOA, GPIOB).
 * @param  GPIO_Pin  Specifies the GPIO pin number.
 *
 * @note   Used to read data bits from the DHT11 sensor.
 */
static void DHT11_Set_Pin_Input(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin);


/**
 * @brief  Generate a microsecond-level delay using a timer.
 *
 * @param  time  Delay duration in microseconds.
 *
 * @note   This function relies on TIM_DHT11 for timing.
 *         Adjust according to your timer configuration.
 */
static void DHT11_Delay_us(uint16_t time);


/**
 * @brief  Perform a measurement from the DHT11 sensor.
 *
 * @param  DHT11  Pointer to a DHT11_t structure that will store
 *                the measured temperature, humidity, and status.
 *
 * @note   This function initiates communication with the DHT11 sensor,
 *         reads the 40-bit data stream, and updates the provided structure.
 */
void Measure_DHT11(DHT11_t *DHT11);

#endif /* DHT11_H_ */
