################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../solver_code/linsys/cpu/direct/private.c 

OBJS += \
./solver_code/linsys/cpu/direct/private.o 

C_DEPS += \
./solver_code/linsys/cpu/direct/private.d 


# Each subdirectory must supply rules for building sources it contributes
solver_code/linsys/cpu/direct/%.o solver_code/linsys/cpu/direct/%.su solver_code/linsys/cpu/direct/%.cyclo: ../solver_code/linsys/cpu/direct/%.c solver_code/linsys/cpu/direct/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -DNOTIMER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/stm32_project_workspace/Convex_Op_Example/DHT11" -I"D:/stm32_project_workspace/Convex_Op_Example/Convex" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/include" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/cpu/direct" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/external/amd" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/external/qdldl" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys" -I"D:/stm32_project_workspace/Convex_Op_Example/Motor_Driver" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-solver_code-2f-linsys-2f-cpu-2f-direct

clean-solver_code-2f-linsys-2f-cpu-2f-direct:
	-$(RM) ./solver_code/linsys/cpu/direct/private.cyclo ./solver_code/linsys/cpu/direct/private.d ./solver_code/linsys/cpu/direct/private.o ./solver_code/linsys/cpu/direct/private.su

.PHONY: clean-solver_code-2f-linsys-2f-cpu-2f-direct

