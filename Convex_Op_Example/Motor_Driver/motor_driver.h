/*
 * motor_driver.h
 *
 *  Created on: Oct 18, 2025
 *      Author: iek
 */

#ifndef MOTOR_DRIVER_H_
#define MOTOR_DRIVER_H_

#include "stm32f4xx_hal.h"

extern TIM_HandleTypeDef htim2;
#define MOTOR_HTIM 		 			htim2


#define MOTOR_TIM_CHANNEL 			TIM_CHANNEL_1
#define MOTOR_IN1_Pin 				GPIO_PIN_5
#define MOTOR_IN1_GPIO_Port 		GPIOA
#define MOTOR_IN2_Pin 				GPIO_PIN_6
#define MOTOR_IN2_GPIO_Port 		GPIOA


#define Motor_Reset_PIN 			0
#define Motor_Set_Pin 				1


//#define REVERSE DIRECTION_ON

typedef enum {

	MOTOR_LEFT, MOTOR_RIGHT

} motor_direction_t;

void Start_Motor(uint32_t speed, motor_direction_t direction);
void Update_Motor_Speed(uint32_t speed);
void Stop_Motor();

#endif /* MOTOR_DRIVER_H_ */
