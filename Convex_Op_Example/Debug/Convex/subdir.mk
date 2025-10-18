################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Convex/cpg_solve.c \
../Convex/cpg_workspace.c 

OBJS += \
./Convex/cpg_solve.o \
./Convex/cpg_workspace.o 

C_DEPS += \
./Convex/cpg_solve.d \
./Convex/cpg_workspace.d 


# Each subdirectory must supply rules for building sources it contributes
Convex/%.o Convex/%.su Convex/%.cyclo: ../Convex/%.c Convex/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -DNOTIMER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/stm32_project_workspace/Convex_Op_Example/DHT11" -I"D:/stm32_project_workspace/Convex_Op_Example/Convex" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/include" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/cpu/direct" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/external/amd" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/external/qdldl" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys" -I"D:/stm32_project_workspace/Convex_Op_Example/Motor_Driver" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Convex

clean-Convex:
	-$(RM) ./Convex/cpg_solve.cyclo ./Convex/cpg_solve.d ./Convex/cpg_solve.o ./Convex/cpg_solve.su ./Convex/cpg_workspace.cyclo ./Convex/cpg_workspace.d ./Convex/cpg_workspace.o ./Convex/cpg_workspace.su

.PHONY: clean-Convex

