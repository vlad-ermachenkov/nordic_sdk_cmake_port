set(SDK_DIR "/mnt/c/Users/ermac/Documents/SDKs/nRF5SDK160098a08e2")
set(CMSIS_inc_dir "${SDK_DIR}/components/toolchain/cmsis/include")
# set(CMSIS_dsp_lib_dir "${SDK_DIR}/components/toolchain/dsp/GCC")
set(SDK_LIB_DIR "${SDK_DIR}/components/libraries")

set(nrfx_dir "${SDK_DIR}/modules/nrfx")
set(nrfx_soc_dir "${nrfx_dir}/soc")
set(nrfx_hal_dir "${nrfx_dir}/hal")
set(nrfx_mdk_dir "${nrfx_dir}/mdk")
set(nrfx_drivers_dir "${nrfx_dir}/drivers")
set(nrfx_helpers_dir "${nrfx_dir}/helpers/nrfx_gppi")

set(int_nrfx_dir "${SDK_DIR}/integration/nrfx")
set(int_nrfx_legacy_dir "${int_nrfx_dir}/legacy")

set(nrfx_src 
  ${nrfx_mdk_dir}/gcc_startup_nrf52840.S
  ${nrfx_mdk_dir}/system_nrf52840.c
)

set(nrf_lib_util_inc
  ${SDK_LIB_DIR}/util
)

set(nrfx_inc
  ${nrfx_dir}
  ${nrfx_soc_dir}
  ${nrfx_mdk_dir}
  ${nrfx_helpers_dir}
  ${nrfx_hal_dir}
  ${nrfx_drivers_dir}
  ${nrfx_drivers_dir}/include
  ${int_nrfx_dir}
  ${int_nrfx_legacy_dir}
  ${CMSIS_inc_dir}
)

set(nrf_lib_util_src 
  ${SDK_LIB_DIR}/util/app_error.c
  ${SDK_LIB_DIR}/util/app_error_handler_gcc.c
  ${SDK_LIB_DIR}/util/app_error_weak.c
  ${SDK_LIB_DIR}/util/app_util_platform.c
  ${SDK_LIB_DIR}/util/nrf_assert.c
  ${SDK_LIB_DIR}/util/sdk_mapped_flags.c
)
set(nrf_lib_util_inc
  ${SDK_LIB_DIR}/util
)

set(nrf_lib_log_dir ${SDK_LIB_DIR}/log)

set(nrf_lib_log_src 
  "${nrf_lib_log_dir}/src/nrf_log_frontend.c"
  "${nrf_lib_log_dir}/src/nrf_log_str_formatter.c"
  "${nrf_lib_log_dir}/src/nrf_log_default_backends.c"
  "${nrf_lib_log_dir}/src/nrf_log_backend_uart.c"
  "${nrf_lib_log_dir}/src/nrf_log_backend_serial.c"
  "${nrf_lib_log_dir}/src/nrf_log_backend_rtt.c"
)

set(nrf_lib_log_inc
  "${nrf_lib_log_dir}/src"
  "${nrf_lib_log_dir}"
)

set(nrf_lib_section_dir ${SDK_LIB_DIR}/experimental_section_vars)

set(nrf_lib_section_src
  "${nrf_lib_section_dir}/nrf_section_iter.c"
)

set(nrf_lib_section_inc
  "${nrf_lib_section_dir}"
)

set(nrf_lib_strerror_dir ${SDK_LIB_DIR}/strerror)

set(nrf_lib_strerror_src
  "${nrf_lib_strerror_dir}/nrf_strerror.c"
)

set(nrf_lib_strerror_inc
  "${nrf_lib_strerror_dir}"
)


#nrf delay
set(nrf_lib_delay_dir ${SDK_LIB_DIR}/delay)

set(nrf_lib_delay_inc
  "${nrf_lib_delay_dir}"
)

#######################################
set(overall_inc
	"${nrfx_inc}"
	"${SDK_DIR}/examples/peripheral/blinky/pca10056/blank/config"
	"${SDK_DIR}/components/boards"
	"${SDK_DIR}/components/drivers_nrf/nrf_soc_nosd"
	"${nrf_lib_util_inc}"
	"${nrf_lib_delay_inc}"
	"${nrf_lib_strerror_inc}"
	"${nrf_lib_section_inc}"
	"${nrf_lib_log_inc}"
)

set(board_src_list
	"${nrf_lib_util_src}"
	"${nrf_lib_log_src}"
	"${nrf_lib_section_src}"
	"${nrf_lib_strerror_src}"
	"${SDK_DIR}/components/boards/boards.c"
)

set(SDK_DEFS "-DNRF52840_XXAA -DBOARD_PCA10056 -DBSP_DEFINES_ONLY -DCONFIG_GPIO_AS_PINRESET -DFLOAT_ABI_HARD")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${SDK_DEFS}")

include_directories("${overall_inc}")
