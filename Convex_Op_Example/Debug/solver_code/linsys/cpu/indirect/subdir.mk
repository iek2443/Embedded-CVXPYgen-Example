################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../solver_code/linsys/cpu/indirect/private.c 

OBJS += \
./solver_code/linsys/cpu/indirect/private.o 

C_DEPS += \
./solver_code/linsys/cpu/indirect/private.d 


# Each subdirectory must supply rules for building sources it contributes
solver_code/linsys/cpu/indirect/%.o solver_code/linsys/cpu/indirect/%.su solver_code/linsys/cpu/indirect/%.cyclo: ../solver_code/linsys/cpu/indirect/%.c solver_code/linsys/cpu/indirect/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -DNOTIMER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/stm32_project_workspace/Convex_Op_Example/DHT11" -I"D:/stm32_project_workspace/Convex_Op_Example/Convex" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/include" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/cpu/direct" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/cpu/indirect" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/external/amd" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/external/qdldl" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-solver_code-2f-linsys-2f-cpu-2f-indirect

clean-solver_code-2f-linsys-2f-cpu-2f-indirect:
	-$(RM) ./solver_code/linsys/cpu/indirect/private.cyclo ./solver_code/linsys/cpu/indirect/private.d ./solver_code/linsys/cpu/indirect/private.o ./solver_code/linsys/cpu/indirect/private.su

.PHONY: clean-solver_code-2f-linsys-2f-cpu-2f-indirect

