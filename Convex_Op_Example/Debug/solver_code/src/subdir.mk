################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../solver_code/src/aa.c \
../solver_code/src/cones.c \
../solver_code/src/ctrlc.c \
../solver_code/src/linalg.c \
../solver_code/src/normalize.c \
../solver_code/src/rw.c \
../solver_code/src/scs.c \
../solver_code/src/scs_version.c \
../solver_code/src/util.c 

OBJS += \
./solver_code/src/aa.o \
./solver_code/src/cones.o \
./solver_code/src/ctrlc.o \
./solver_code/src/linalg.o \
./solver_code/src/normalize.o \
./solver_code/src/rw.o \
./solver_code/src/scs.o \
./solver_code/src/scs_version.o \
./solver_code/src/util.o 

C_DEPS += \
./solver_code/src/aa.d \
./solver_code/src/cones.d \
./solver_code/src/ctrlc.d \
./solver_code/src/linalg.d \
./solver_code/src/normalize.d \
./solver_code/src/rw.d \
./solver_code/src/scs.d \
./solver_code/src/scs_version.d \
./solver_code/src/util.d 


# Each subdirectory must supply rules for building sources it contributes
solver_code/src/%.o solver_code/src/%.su solver_code/src/%.cyclo: ../solver_code/src/%.c solver_code/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -DNOTIMER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/stm32_project_workspace/Convex_Op_Example/DHT11" -I"D:/stm32_project_workspace/Convex_Op_Example/Convex" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/include" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/cpu/direct" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/external/amd" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/external/qdldl" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys" -I"D:/stm32_project_workspace/Convex_Op_Example/Motor_Driver" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-solver_code-2f-src

clean-solver_code-2f-src:
	-$(RM) ./solver_code/src/aa.cyclo ./solver_code/src/aa.d ./solver_code/src/aa.o ./solver_code/src/aa.su ./solver_code/src/cones.cyclo ./solver_code/src/cones.d ./solver_code/src/cones.o ./solver_code/src/cones.su ./solver_code/src/ctrlc.cyclo ./solver_code/src/ctrlc.d ./solver_code/src/ctrlc.o ./solver_code/src/ctrlc.su ./solver_code/src/linalg.cyclo ./solver_code/src/linalg.d ./solver_code/src/linalg.o ./solver_code/src/linalg.su ./solver_code/src/normalize.cyclo ./solver_code/src/normalize.d ./solver_code/src/normalize.o ./solver_code/src/normalize.su ./solver_code/src/rw.cyclo ./solver_code/src/rw.d ./solver_code/src/rw.o ./solver_code/src/rw.su ./solver_code/src/scs.cyclo ./solver_code/src/scs.d ./solver_code/src/scs.o ./solver_code/src/scs.su ./solver_code/src/scs_version.cyclo ./solver_code/src/scs_version.d ./solver_code/src/scs_version.o ./solver_code/src/scs_version.su ./solver_code/src/util.cyclo ./solver_code/src/util.d ./solver_code/src/util.o ./solver_code/src/util.su

.PHONY: clean-solver_code-2f-src

