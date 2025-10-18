################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../solver_code/linsys/external/amd/SuiteSparse_config.c \
../solver_code/linsys/external/amd/amd_1.c \
../solver_code/linsys/external/amd/amd_2.c \
../solver_code/linsys/external/amd/amd_aat.c \
../solver_code/linsys/external/amd/amd_control.c \
../solver_code/linsys/external/amd/amd_defaults.c \
../solver_code/linsys/external/amd/amd_dump.c \
../solver_code/linsys/external/amd/amd_global.c \
../solver_code/linsys/external/amd/amd_info.c \
../solver_code/linsys/external/amd/amd_order.c \
../solver_code/linsys/external/amd/amd_post_tree.c \
../solver_code/linsys/external/amd/amd_postorder.c \
../solver_code/linsys/external/amd/amd_preprocess.c \
../solver_code/linsys/external/amd/amd_valid.c 

OBJS += \
./solver_code/linsys/external/amd/SuiteSparse_config.o \
./solver_code/linsys/external/amd/amd_1.o \
./solver_code/linsys/external/amd/amd_2.o \
./solver_code/linsys/external/amd/amd_aat.o \
./solver_code/linsys/external/amd/amd_control.o \
./solver_code/linsys/external/amd/amd_defaults.o \
./solver_code/linsys/external/amd/amd_dump.o \
./solver_code/linsys/external/amd/amd_global.o \
./solver_code/linsys/external/amd/amd_info.o \
./solver_code/linsys/external/amd/amd_order.o \
./solver_code/linsys/external/amd/amd_post_tree.o \
./solver_code/linsys/external/amd/amd_postorder.o \
./solver_code/linsys/external/amd/amd_preprocess.o \
./solver_code/linsys/external/amd/amd_valid.o 

C_DEPS += \
./solver_code/linsys/external/amd/SuiteSparse_config.d \
./solver_code/linsys/external/amd/amd_1.d \
./solver_code/linsys/external/amd/amd_2.d \
./solver_code/linsys/external/amd/amd_aat.d \
./solver_code/linsys/external/amd/amd_control.d \
./solver_code/linsys/external/amd/amd_defaults.d \
./solver_code/linsys/external/amd/amd_dump.d \
./solver_code/linsys/external/amd/amd_global.d \
./solver_code/linsys/external/amd/amd_info.d \
./solver_code/linsys/external/amd/amd_order.d \
./solver_code/linsys/external/amd/amd_post_tree.d \
./solver_code/linsys/external/amd/amd_postorder.d \
./solver_code/linsys/external/amd/amd_preprocess.d \
./solver_code/linsys/external/amd/amd_valid.d 


# Each subdirectory must supply rules for building sources it contributes
solver_code/linsys/external/amd/%.o solver_code/linsys/external/amd/%.su solver_code/linsys/external/amd/%.cyclo: ../solver_code/linsys/external/amd/%.c solver_code/linsys/external/amd/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -DNOTIMER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/stm32_project_workspace/Convex_Op_Example/DHT11" -I"D:/stm32_project_workspace/Convex_Op_Example/Convex" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/include" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/cpu/direct" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/external/amd" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys/external/qdldl" -I"D:/stm32_project_workspace/Convex_Op_Example/solver_code/linsys" -I"D:/stm32_project_workspace/Convex_Op_Example/Motor_Driver" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-solver_code-2f-linsys-2f-external-2f-amd

clean-solver_code-2f-linsys-2f-external-2f-amd:
	-$(RM) ./solver_code/linsys/external/amd/SuiteSparse_config.cyclo ./solver_code/linsys/external/amd/SuiteSparse_config.d ./solver_code/linsys/external/amd/SuiteSparse_config.o ./solver_code/linsys/external/amd/SuiteSparse_config.su ./solver_code/linsys/external/amd/amd_1.cyclo ./solver_code/linsys/external/amd/amd_1.d ./solver_code/linsys/external/amd/amd_1.o ./solver_code/linsys/external/amd/amd_1.su ./solver_code/linsys/external/amd/amd_2.cyclo ./solver_code/linsys/external/amd/amd_2.d ./solver_code/linsys/external/amd/amd_2.o ./solver_code/linsys/external/amd/amd_2.su ./solver_code/linsys/external/amd/amd_aat.cyclo ./solver_code/linsys/external/amd/amd_aat.d ./solver_code/linsys/external/amd/amd_aat.o ./solver_code/linsys/external/amd/amd_aat.su ./solver_code/linsys/external/amd/amd_control.cyclo ./solver_code/linsys/external/amd/amd_control.d ./solver_code/linsys/external/amd/amd_control.o ./solver_code/linsys/external/amd/amd_control.su ./solver_code/linsys/external/amd/amd_defaults.cyclo ./solver_code/linsys/external/amd/amd_defaults.d ./solver_code/linsys/external/amd/amd_defaults.o ./solver_code/linsys/external/amd/amd_defaults.su ./solver_code/linsys/external/amd/amd_dump.cyclo ./solver_code/linsys/external/amd/amd_dump.d ./solver_code/linsys/external/amd/amd_dump.o ./solver_code/linsys/external/amd/amd_dump.su ./solver_code/linsys/external/amd/amd_global.cyclo ./solver_code/linsys/external/amd/amd_global.d ./solver_code/linsys/external/amd/amd_global.o ./solver_code/linsys/external/amd/amd_global.su ./solver_code/linsys/external/amd/amd_info.cyclo ./solver_code/linsys/external/amd/amd_info.d ./solver_code/linsys/external/amd/amd_info.o ./solver_code/linsys/external/amd/amd_info.su ./solver_code/linsys/external/amd/amd_order.cyclo ./solver_code/linsys/external/amd/amd_order.d ./solver_code/linsys/external/amd/amd_order.o ./solver_code/linsys/external/amd/amd_order.su ./solver_code/linsys/external/amd/amd_post_tree.cyclo ./solver_code/linsys/external/amd/amd_post_tree.d ./solver_code/linsys/external/amd/amd_post_tree.o ./solver_code/linsys/external/amd/amd_post_tree.su ./solver_code/linsys/external/amd/amd_postorder.cyclo ./solver_code/linsys/external/amd/amd_postorder.d ./solver_code/linsys/external/amd/amd_postorder.o ./solver_code/linsys/external/amd/amd_postorder.su ./solver_code/linsys/external/amd/amd_preprocess.cyclo ./solver_code/linsys/external/amd/amd_preprocess.d ./solver_code/linsys/external/amd/amd_preprocess.o ./solver_code/linsys/external/amd/amd_preprocess.su ./solver_code/linsys/external/amd/amd_valid.cyclo ./solver_code/linsys/external/amd/amd_valid.d ./solver_code/linsys/external/amd/amd_valid.o ./solver_code/linsys/external/amd/amd_valid.su

.PHONY: clean-solver_code-2f-linsys-2f-external-2f-amd

