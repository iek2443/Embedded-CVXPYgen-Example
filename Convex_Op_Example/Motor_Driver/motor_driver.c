/*
 * motor_driver.c
 *
 *  Created on: Oct 18, 2025
 *      Author: iek
 */

#include "motor_driver.h"

void Start_Motor(uint32_t speed, motor_direction_t direction) {

#ifdef REVERSE DIRECTION_ON

	if (direction == MOTOR_LEFT) {
		HAL_GPIO_WritePin(MOTOR_IN1_GPIO_Port, MOTOR_IN1_Pin, Motor_Set_Pin);
		HAL_GPIO_WritePin(MOTOR_IN2_GPIO_Port, MOTOR_IN1_Pin, Motor_Reset_PIN);

	} else {
		HAL_GPIO_WritePin(MOTOR_IN1_GPIO_Port, MOTOR_IN1_Pin, Motor_Reset_PIN);
		HAL_GPIO_WritePin(MOTOR_IN2_GPIO_Port, MOTOR_IN1_Pin, Motor_Set_Pin);
	}

#else
	if (direction == MOTOR_LEFT) {
		HAL_GPIO_WritePin(MOTOR_IN1_GPIO_Port, MOTOR_IN1_Pin, Motor_Reset_PIN);
		HAL_GPIO_WritePin(MOTOR_IN2_GPIO_Port, MOTOR_IN1_Pin, Motor_Set_Pin);

	} else {
		HAL_GPIO_WritePin(MOTOR_IN1_GPIO_Port, MOTOR_IN1_Pin, Motor_Set_Pin);
		HAL_GPIO_WritePin(MOTOR_IN2_GPIO_Port, MOTOR_IN1_Pin, Motor_Reset_PIN);
	}

#endif

	HAL_TIM_PWM_Start(&MOTOR_HTIM, MOTOR_TIM_CHANNEL);
	__HAL_TIM_SET_COMPARE(&MOTOR_HTIM, MOTOR_TIM_CHANNEL, speed);
}

void Update_Motor_Speed(uint32_t speed) {

	__HAL_TIM_SET_COMPARE(&MOTOR_HTIM, MOTOR_TIM_CHANNEL, speed);
}

void Stop_Motor() {

	HAL_GPIO_WritePin(MOTOR_IN1_GPIO_Port, MOTOR_IN1_Pin, Motor_Reset_PIN);
	HAL_GPIO_WritePin(MOTOR_IN2_GPIO_Port, MOTOR_IN1_Pin, Motor_Reset_PIN);

	__HAL_TIM_SET_COMPARE(&MOTOR_HTIM, MOTOR_TIM_CHANNEL, 0);
	HAL_TIM_PWM_Stop(&MOTOR_HTIM, MOTOR_TIM_CHANNEL);
}
