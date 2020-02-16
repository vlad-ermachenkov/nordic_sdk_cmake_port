# Source files common to all targets
set(SDK_ROOT "/mnt/c/Users/ermac/Documents/SDKs/nRF5SDK160098a08e2")

include(example_ble_hrs_freertos.cmake)

set(example_root_path "${SDK_ROOT}/examples/${example_folder}")
set(example_path "${example_root_path}/${example_name}")
set(example_sd_path "${example_path}/${board_type}/${sd_type}")
set(example_ld_path "${example_sd_path}/armgcc")
set(example_config_path ${example_sd_path}/config)
set(freertos_conf ${example_path}/config)

set(overall_inc ${overall_inc} ${freertos_conf})

set(example_ld ${example_ld_path}/${ld_prefix}_gcc_nrf52.ld)
set(overall_inc ${overall_inc} ${example_config_path})
set(overall_inc ${overall_inc} ${example_path})
set(board_src_list ${board_src_list} ${example_path}/main.c)
##################

include_directories("${overall_inc}")

set(board_mem_defs "-D__HEAP_SIZE=8192 -D__STACK_SIZE=8192")

SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${board_defs} ${board_mem_defs}")
SET(CMAKE_ASM_FLAGS  "${CMAKE_ASM_FLAGS} ${board_defs} ${board_mem_defs}")

SET(CMAKE_EXE_LINKER_FLAGS "-T${example_ld} ${CMAKE_EXE_LINKER_FLAGS}")
SET(CMAKE_EXE_LINKER_FLAGS "-L${SDK_ROOT}/modules/nrfx/mdk ${CMAKE_EXE_LINKER_FLAGS}")
