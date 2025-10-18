/*
 * dht11.c
 *
 *  Created on: Oct 16, 2025
 *      Author: iek
 */
#include "dht11.h"

/**
 * @brief  Configure the specified GPIO pin as output.
 *
 * @param  GPIOx     Pointer to the GPIO port (e.g., GPIOA, GPIOB).
 * @param  GPIO_Pin  Specifies the GPIO pin number.
 *
 * @note   Used to drive the DHT11 data line during the start signal.
 */
static void DHT11_Set_Pin_Output(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin) {

	GPIO_InitTypeDef DHT11_Output = { 0 };

	DHT11_Output.Pin = GPIO_Pin;
	DHT11_Output.Mode = GPIO_MODE_OUTPUT_PP;
	DHT11_Output.Pull = GPIO_NOPULL;
	DHT11_Output.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOx, &DHT11_Output);

}

/**
 * @brief  Configure the specified GPIO pin as input.
 *
 * @param  GPIOx     Pointer to the GPIO port (e.g., GPIOA, GPIOB).
 * @param  GPIO_Pin  Specifies the GPIO pin number.
 *
 * @note   Used to read data bits from the DHT11 sensor.
 */
static void DHT11_Set_Pin_Input(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin) {

	GPIO_InitTypeDef DHT11_Input = { 0 };

	DHT11_Input.Pin = GPIO_Pin;
	DHT11_Input.Mode = GPIO_MODE_INPUT;
	DHT11_Input.Pull = GPIO_NOPULL;
	DHT11_Input.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOx, &DHT11_Input);

}

/**
 * @brief  Generate a microsecond-level delay using a timer.
 *
 * @param  time  Delay duration in microseconds.
 *
 * @note   This function relies on TIM_DHT11 for timing.
 *         Adjust according to your timer configuration.
 */
static void DHT11_Delay_us(uint16_t time) {

	TIM_DHT11->CNT = 0;

	while (TIM_DHT11->CNT < time) {
		__asm__("nop");
	}

}

/**
 * @brief  Perform a measurement from the DHT11 sensor.
 *
 * @param  DHT11  Pointer to a DHT11_t structure that will store
 *                the measured temperature, humidity, and status.
 *
 * @note   This function initiates communication with the DHT11 sensor,
 *         reads the 40-bit data stream, and updates the provided structure.
 */
void Measure_DHT11(DHT11_t *DHT11) {

	uint16_t DHT_time1, DHT_time2;
	uint16_t DHT_bit[40];
	uint16_t Temp = 0;
	uint16_t Temp2 = 0;
	uint16_t Hum = 0;
	uint16_t Hum2 = 0;
	uint16_t check = 0;

	DHT11->Measurement = DHT11_FAILD;

	DHT11_Set_Pin_Output(DHT11_GPIO_Port, DHT11_Pin);
	HAL_GPIO_WritePin(DHT11_GPIO_Port, DHT11_Pin, DHT11_Pin_Reset);
	DHT11_Delay_us(18000);
	DHT11_Set_Pin_Input(DHT11_GPIO_Port, DHT11_Pin);

	TIM_DHT11->CNT = 0;
	while (HAL_GPIO_ReadPin(DHT11_GPIO_Port, DHT11_Pin) == DHT11_Pin_Read_Set) {

		if ((uint16_t) TIM_DHT11->CNT > 500)
			return;

	}

	TIM_DHT11->CNT = 0;
	while (HAL_GPIO_ReadPin(DHT11_GPIO_Port, DHT11_Pin) == DHT11_Pin_Read_Reset) {

		if ((uint16_t) TIM_DHT11->CNT > 500)
			return;
	}
	DHT_time1 = TIM_DHT11->CNT;

	TIM_DHT11->CNT = 0;
	while (HAL_GPIO_ReadPin(DHT11_GPIO_Port, DHT11_Pin) == DHT11_Pin_Read_Set) {

		if ((uint16_t) TIM_DHT11->CNT > 500)
			return;
	}
	DHT_time2 = TIM_DHT11->CNT;

	if ((DHT_time1 < 75) && (DHT_time1 > 85) && (DHT_time2 < 75)
			&& (DHT_time2 > 85))
		return;

	for (uint8_t i = 0; i < 40; i++) {
		TIM_DHT11->CNT = 0;
		while (HAL_GPIO_ReadPin(DHT11_GPIO_Port, DHT11_Pin)
				== DHT11_Pin_Read_Reset) {

			if ((uint16_t) TIM_DHT11->CNT > 500)
				return;
		}

		TIM_DHT11->CNT = 0;
		while (HAL_GPIO_ReadPin(DHT11_GPIO_Port, DHT11_Pin)
				== DHT11_Pin_Read_Set) {

			if ((uint16_t) TIM_DHT11->CNT > 500)
				return;
		}
		DHT_time1 = TIM_DHT11->CNT;

		if ((DHT_time1 > 20) && (DHT_time1 < 30))
			DHT_bit[i] = 0;

		if ((DHT_time1 > 60) && (DHT_time1 < 80))
			DHT_bit[i] = 1;

	}

	for (uint8_t i = 0, j = 7; i < 8; i++, j--) {

		Hum |= (DHT_bit[i] << j);
		Hum2 |= (DHT_bit[i + 8] << j);
		Temp |= (DHT_bit[i + 16] << j);
		Temp2 |= (DHT_bit[i + 24] << j);
		check |= (DHT_bit[i + 32] << j);
	}

	if (check != Temp + Temp2 + Hum + Hum2)
		return;

	DHT11->Humidity = Hum;
	DHT11->Temperature = Temp;
	DHT11->Measurement = DHT11_SUCCESS;

}
