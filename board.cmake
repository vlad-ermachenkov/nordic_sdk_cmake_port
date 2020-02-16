# Source files common to all targets
set(SDK_ROOT "/mnt/c/Users/ermac/Documents/SDKs/nRF5SDK160098a08e2")

# set(board_src_list
#   ${SDK_ROOT}/modules/nrfx/mdk/gcc_startup_nrf52840.S
#   ${SDK_ROOT}/components/libraries/log/src/nrf_log_frontend.c
#   ${SDK_ROOT}/components/libraries/log/src/nrf_log_str_formatter.c
#   ${SDK_ROOT}/components/boards/boards.c
#   ${SDK_ROOT}/components/libraries/util/app_error.c
#   ${SDK_ROOT}/components/libraries/util/app_error_handler_gcc.c
#   ${SDK_ROOT}/components/libraries/util/app_error_weak.c
#   ${SDK_ROOT}/components/libraries/util/app_util_platform.c
#   ${SDK_ROOT}/components/libraries/util/nrf_assert.c
#   ${SDK_ROOT}/components/libraries/atomic/nrf_atomic.c
#   ${SDK_ROOT}/components/libraries/balloc/nrf_balloc.c
#   ${SDK_ROOT}/external/fprintf/nrf_fprintf.c
#   ${SDK_ROOT}/external/fprintf/nrf_fprintf_format.c
#   ${SDK_ROOT}/components/libraries/memobj/nrf_memobj.c
#   ${SDK_ROOT}/components/libraries/ringbuf/nrf_ringbuf.c
#   ${SDK_ROOT}/components/libraries/strerror/nrf_strerror.c
#   ${SDK_ROOT}/modules/nrfx/soc/nrfx_atomic.c
#   ${SDK_ROOT}/modules/nrfx/mdk/system_nrf52840.c
# )
# # Include folders common to all targets
# set(overall_inc
#   ${SDK_ROOT}/components
#   ${SDK_ROOT}/modules/nrfx/mdk
#   ${SDK_ROOT}/components/libraries/strerror
#   ${SDK_ROOT}/components/toolchain/cmsis/include
#   ${SDK_ROOT}/components/libraries/util
#   ${SDK_ROOT}/components/libraries/balloc
#   ${SDK_ROOT}/components/libraries/ringbuf
#   ${SDK_ROOT}/modules/nrfx/hal
#   ${SDK_ROOT}/components/libraries/bsp
#   ${SDK_ROOT}/components/libraries/log
#   ${SDK_ROOT}/modules/nrfx
#   ${SDK_ROOT}/components/libraries/experimental_section_vars
#   ${SDK_ROOT}/components/libraries/delay
#   ${SDK_ROOT}/integration/nrfx
#   ${SDK_ROOT}/components/drivers_nrf/nrf_soc_nosd
#   ${SDK_ROOT}/components/libraries/atomic
#   ${SDK_ROOT}/components/boards
#   ${SDK_ROOT}/components/libraries/memobj
#   ${SDK_ROOT}/external/fprintf
#   ${SDK_ROOT}/components/libraries/log/src
# )

set(board_src_list
  ${SDK_ROOT}/modules/nrfx/mdk/gcc_startup_nrf52840.S
  ${SDK_ROOT}/components/libraries/log/src/nrf_log_frontend.c
  ${SDK_ROOT}/components/libraries/log/src/nrf_log_str_formatter.c
  ${SDK_ROOT}/components/boards/boards.c
  ${SDK_ROOT}/external/freertos/source/croutine.c
  ${SDK_ROOT}/external/freertos/source/event_groups.c
  ${SDK_ROOT}/external/freertos/source/portable/MemMang/heap_1.c
  ${SDK_ROOT}/external/freertos/source/list.c
  ${SDK_ROOT}/external/freertos/portable/GCC/nrf52/port.c
  ${SDK_ROOT}/external/freertos/portable/CMSIS/nrf52/port_cmsis.c
  ${SDK_ROOT}/external/freertos/portable/CMSIS/nrf52/port_cmsis_systick.c
  ${SDK_ROOT}/external/freertos/source/queue.c
  ${SDK_ROOT}/external/freertos/source/stream_buffer.c
  ${SDK_ROOT}/external/freertos/source/tasks.c
  ${SDK_ROOT}/external/freertos/source/timers.c
  ${SDK_ROOT}/components/libraries/button/app_button.c
  ${SDK_ROOT}/components/libraries/util/app_error.c
  ${SDK_ROOT}/components/libraries/util/app_error_handler_gcc.c
  ${SDK_ROOT}/components/libraries/util/app_error_weak.c
  ${SDK_ROOT}/components/libraries/timer/app_timer_freertos.c
  ${SDK_ROOT}/components/libraries/util/app_util_platform.c
  ${SDK_ROOT}/components/libraries/util/nrf_assert.c
  ${SDK_ROOT}/components/libraries/atomic/nrf_atomic.c
  ${SDK_ROOT}/components/libraries/balloc/nrf_balloc.c
  ${SDK_ROOT}/external/fprintf/nrf_fprintf.c
  ${SDK_ROOT}/external/fprintf/nrf_fprintf_format.c
  ${SDK_ROOT}/components/libraries/memobj/nrf_memobj.c
  ${SDK_ROOT}/components/libraries/ringbuf/nrf_ringbuf.c
  ${SDK_ROOT}/components/libraries/strerror/nrf_strerror.c
  ${SDK_ROOT}/integration/nrfx/legacy/nrf_drv_clock.c
  ${SDK_ROOT}/components/drivers_nrf/nrf_soc_nosd/nrf_nvic.c
  ${SDK_ROOT}/components/drivers_nrf/nrf_soc_nosd/nrf_soc.c
  ${SDK_ROOT}/modules/nrfx/soc/nrfx_atomic.c
  ${SDK_ROOT}/modules/nrfx/drivers/src/nrfx_clock.c
  ${SDK_ROOT}/modules/nrfx/drivers/src/nrfx_gpiote.c
  ${SDK_ROOT}/components/libraries/bsp/bsp.c
#   $(PROJ_DIR)/main.c
  ${SDK_ROOT}/modules/nrfx/mdk/system_nrf52840.c
)
# Include folders common to all targets
set(overall_inc 
  # $(PROJ_DIR)/config
  ${SDK_ROOT}/components
  ${SDK_ROOT}/modules/nrfx/mdk
  # $(PROJ_DIR)
  ${SDK_ROOT}/components/libraries/timer
  ${SDK_ROOT}/components/libraries/strerror
  ${SDK_ROOT}/components/toolchain/cmsis/include
  ${SDK_ROOT}/external/freertos/source/include
  # ${SDK_ROOT}/external/freertos/config
  ${SDK_ROOT}/components/libraries/util
#   ../config
  ${SDK_ROOT}/components/libraries/balloc
  ${SDK_ROOT}/components/libraries/ringbuf
  ${SDK_ROOT}/modules/nrfx/hal
  ${SDK_ROOT}/components/libraries/bsp
  ${SDK_ROOT}/components/libraries/log
  ${SDK_ROOT}/components/libraries/button
  ${SDK_ROOT}/modules/nrfx
  ${SDK_ROOT}/components/libraries/experimental_section_vars
  ${SDK_ROOT}/integration/nrfx/legacy
  ${SDK_ROOT}/external/freertos/portable/CMSIS/nrf52
  ${SDK_ROOT}/integration/nrfx
  ${SDK_ROOT}/components/drivers_nrf/nrf_soc_nosd
  ${SDK_ROOT}/components/libraries/atomic
  ${SDK_ROOT}/components/boards
  ${SDK_ROOT}/components/libraries/memobj
  ${SDK_ROOT}/external/freertos/portable/GCC/nrf52
  ${SDK_ROOT}/modules/nrfx/drivers/include
  ${SDK_ROOT}/external/fprintf
  ${SDK_ROOT}/components/libraries/log/src
)

#Example specific#
set(example_name "blinky_freertos")
set(sd_type "blank")
set(board_type "pca10056")
set(ld_prefix "blinky_FreeRTOS")

set(example_root_path "${SDK_ROOT}/examples/peripheral")
set(example_path "${example_root_path}/${example_name}")
set(example_sd_path "${example_path}/${board_type}/${sd_type}")
set(example_ld_path "${example_sd_path}/armgcc")
set(example_config_path ${example_sd_path}/config)
set(freertos_conf ${example_path}/config)

set(overall_inc ${overall_inc} ${freertos_conf})

set(board_defs "-DFREERTOS -DBSP_DEFINES_ONLY ")

set(example_ld ${example_ld_path}/${ld_prefix}_gcc_nrf52.ld)
set(overall_inc ${overall_inc} ${example_config_path})
set(overall_inc ${overall_inc} ${example_path})
set(board_src_list ${board_src_list} ${example_path}/main.c)
##################

message("overall_inc ${overall_inc}")
include_directories("${overall_inc}")

set(board_defs "${board_defs} -DNRF52840_XXAA -DBOARD_PCA10056 -DCONFIG_GPIO_AS_PINRESET -DFLOAT_ABI_HARD")
set(board_mem_defs "-D__HEAP_SIZE=8192 -D__STACK_SIZE=8192")

SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${board_defs} ${board_mem_defs}")
SET(CMAKE_ASM_FLAGS  "${CMAKE_ASM_FLAGS} ${board_defs} ${board_mem_defs}")

SET(CMAKE_EXE_LINKER_FLAGS "-T${example_ld} ${CMAKE_EXE_LINKER_FLAGS}")
SET(CMAKE_EXE_LINKER_FLAGS "-L${SDK_ROOT}/modules/nrfx/mdk ${CMAKE_EXE_LINKER_FLAGS}")
