cmake_minimum_required(VERSION 3.0)

SET(CMAKE_TOOLCHAIN_FILE "toolchain.cmake")
ENABLE_LANGUAGE(ASM)

include(rtos/rtos.cmake)
project(nrf_test)

SET(SDK_ROOT "/mnt/c/Users/ermac/Documents/SDKs/nRF5SDK160098a08e2")

SET(SDK_C_SRC
  ${SDK_ROOT}/components/libraries/log/src/nrf_log_frontend.c
  ${SDK_ROOT}/components/libraries/log/src/nrf_log_str_formatter.c
  ${SDK_ROOT}/components/boards/boards.c
  ${SDK_ROOT}/components/libraries/util/app_error.c
  ${SDK_ROOT}/components/libraries/util/app_error_handler_gcc.c
  ${SDK_ROOT}/components/libraries/util/app_error_weak.c
  ${SDK_ROOT}/components/libraries/util/app_util_platform.c
  ${SDK_ROOT}/components/libraries/util/nrf_assert.c
  ${SDK_ROOT}/components/libraries/atomic/nrf_atomic.c
  ${SDK_ROOT}/components/libraries/balloc/nrf_balloc.c
  ${SDK_ROOT}/external/fprintf/nrf_fprintf.c
  ${SDK_ROOT}/external/fprintf/nrf_fprintf_format.c
  ${SDK_ROOT}/components/libraries/memobj/nrf_memobj.c
  ${SDK_ROOT}/components/libraries/ringbuf/nrf_ringbuf.c
  ${SDK_ROOT}/components/libraries/strerror/nrf_strerror.c
  ${SDK_ROOT}/modules/nrfx/soc/nrfx_atomic.c
  ${SDK_ROOT}/modules/nrfx/mdk/system_nrf52840.c
)

SET(SDK_ASM_SRC
	${SDK_ROOT}/modules/nrfx/mdk/gcc_startup_nrf52840.S
)

SET(APP_SRC
	main.c
)

INCLUDE_DIRECTORIES(
  .
  ${SDK_ROOT}/components
  ${SDK_ROOT}/modules/nrfx/mdk
  ${SDK_ROOT}/components/libraries/strerror
  ${SDK_ROOT}/components/toolchain/cmsis/include
  ${SDK_ROOT}/components/libraries/util
  ${SDK_ROOT}/components/libraries/balloc
  ${SDK_ROOT}/components/libraries/ringbuf
  ${SDK_ROOT}/modules/nrfx/hal
  ${SDK_ROOT}/components/libraries/bsp
  ${SDK_ROOT}/components/libraries/log
  ${SDK_ROOT}/modules/nrfx
  ${SDK_ROOT}/components/libraries/experimental_section_vars
  ${SDK_ROOT}/components/libraries/delay
  ${SDK_ROOT}/integration/nrfx
  ${SDK_ROOT}/components/drivers_nrf/nrf_soc_nosd
  ${SDK_ROOT}/components/libraries/atomic
  ${SDK_ROOT}/components/boards
  ${SDK_ROOT}/components/libraries/memobj
  ${SDK_ROOT}/external/fprintf
  ${SDK_ROOT}/components/libraries/log/src
)

SET(TARGET_SOURCES ${SDK_C_SRC} ${SDK_ASM_SRC} ${APP_SRC})

SET(OPT_FLAGS "-O3 -g3")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OPT_FLAGS}")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m4")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb -mabi=aapcs")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mfloat-abi=hard -mfpu=fpv4-sp-d16")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ffunction-sections -fdata-sections -fno-strict-aliasing")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-builtin -fshort-enums")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DBOARD_PCA10056 -DBSP_DEFINES_ONLY -DCONFIG_GPIO_AS_PINRESET -DFLOAT_ABI_HARD -DNRF52840_XXAA")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__HEAP_SIZE=8192 -D__STACK_SIZE=8192")


set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Werror")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OPT_FLAGS}")

set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -g3")

set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -mcpu=cortex-m4")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -mthumb -mabi=aapcs")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -mfloat-abi=hard -mfpu=fpv4-sp-d16")

set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -DBOARD_PCA10056 -DBSP_DEFINES_ONLY -DCONFIG_GPIO_AS_PINRESET -DFLOAT_ABI_HARD -DNRF52840_XXAA")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -D__HEAP_SIZE=8192 -D__STACK_SIZE=8192")



SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OPT_FLAGS}")

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mcpu=cortex-m4")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mthumb -mabi=aapcs")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mfloat-abi=hard -mfpu=fpv4-sp-d16")

#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T${CMAKE_CURRENT_SOURCE_DIR}/linker_scripts/blinky_gcc_nrf52.ld")
#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T${CMAKE_CURRENT_SOURCE_DIR}/linker_scripts/nrf_common.ld")
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/linker_scripts/blinky_gcc_nrf52.ld ${CMAKE_CURRENT_BINARY_DIR}/blinky_gcc_nrf52.ld)
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/linker_scripts/nrf_common.ld ${CMAKE_CURRENT_BINARY_DIR}/nrf_common.ld)
SET(CMAKE_EXE_LINKER_FLAGS "-T${CMAKE_CURRENT_BINARY_DIR}/blinky_gcc_nrf52.ld ${CMAKE_EXE_LINKER_FLAGS}")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --specs=nano.specs")

ADD_EXECUTABLE(${CMAKE_PROJECT_NAME}.elf ${APP_SRC} ${SDK_ASM_SRC} ${SDK_C_SRC})

TARGET_LINK_LIBRARIES(${CMAKE_PROJECT_NAME}.elf FreeRTOS_lib)
TARGET_LINK_LIBRARIES(${CMAKE_PROJECT_NAME}.elf NRF_DRV_CLOCK_LEGACY)
TARGET_LINK_LIBRARIES(${CMAKE_PROJECT_NAME}.elf NRF_DRV_CLOCK)


ADD_CUSTOM_COMMAND(TARGET ${CMAKE_PROJECT_NAME}.elf POST_BUILD COMMAND ${CMAKE_OBJCOPY} ARGS -Oihex ${CMAKE_PROJECT_NAME}.elf ${CMAKE_PROJECT_NAME}.hex)
ADD_CUSTOM_COMMAND(TARGET ${CMAKE_PROJECT_NAME}.elf POST_BUILD COMMAND ${CMAKE_OBJCOPY} ARGS -Obinary ${CMAKE_PROJECT_NAME}.elf ${CMAKE_PROJECT_NAME}.bin)

ADD_CUSTOM_COMMAND(TARGET ${CMAKE_PROJECT_NAME}.elf POST_BUILD COMMAND ${CMAKE_SIZE} ARGS ${CMAKE_PROJECT_NAME}.elf)

#target_include_directories(${CMAKE_PROJECT_NAME}.elf PUBLIC ${NRF_SDK_DRV}/include)
#target_include_directories(${CMAKE_PROJECT_NAME}.elf PUBLIC ${NRF_SDK_DRV_LEGACY})
#add_dependencies(${CMAKE_PROJECT_NAME}.elf NRF_DRV_CLOCK)
