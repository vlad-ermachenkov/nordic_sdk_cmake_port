SET(FREERTOS_PATH "/mnt/c/Users/ermac/Documents/SDKs/nRF5SDK160098a08e2/external/freertos")
SET(FREERTOS_CONFIG_PATH "${FREERTOS_PATH}/config")
SET(FREERTOS_PORT_PATH "${FREERTOS_PATH}/portable/GCC/nrf52")
SET(FREERTOS_SRC_PATH "${FREERTOS_PATH}/source")
SET(FREERTOS_INC_PATH "${FREERTOS_PATH}/source/include")
SET(FREERTOS_HEAP_PATH "${FREERTOS_PATH}/source/portable/MemMang")
SET(FREERTOS_MPU_WRAPPERS_PATH "${FREERTOS_PATH}/source/portable/Common")
SET(FREERTOS_PORT_CMSIS_PATH "${FREERTOS_PATH}/portable/CMSIS/nrf52")

FILE(GLOB FREERTOS_PORT_SRC "${FREERTOS_PORT_PATH}/*.c")
FILE(GLOB FREERTOS_SRC "${FREERTOS_SRC_PATH}/*.c")
FILE(GLOB FREERTOS_PORT_CMSIS_SRC "${FREERTOS_PORT_CMSIS_PATH}/*.c")

SET(FREERTOS_SOURCES 
	${FREERTOS_SRC}
	${FREERTOS_HEAP_PATH}/heap_4.c
	${FREERTOS_PORT_CMSIS_SRC}
	${FREERTOS_PORT_SRC}
)

set(FREERTOS_HEADERS
	${FREERTOS_CONFIG_PATH}/
	${FREERTOS_PORT_PATH}/
	${FREERTOS_INC_PATH}
	${FREERTOS_PORT_CMSIS_PATH}
)

INCLUDE_DIRECTORIES(${INCLUDE_DIRECTORIES} ${FREERTOS_HEADERS})

set(NRF_SDK "/mnt/c/Users/ermac/Documents/SDKs/nRF5SDK160098a08e2")
set(NRF_SDK_DRV_LEGACY "${NRF_SDK}/integration/nrfx/legacy")
set(NRF_SDK_DRV "${NRF_SDK}/modules/nrfx/drivers")

set(NRF_DRV_CLOCK_SRC 
	${NRF_SDK_DRV_LEGACY}/nrf_drv_clock.c
)

set(NRF_DRV_CLOCK_INC
	${NRF_SDK_DRV_LEGACY}/nrf_drv_clock.h
)

ADD_LIBRARY(NRF_DRV_CLOCK_LEGACY STATIC ${NRF_DRV_CLOCK_SRC} ${NRF_DRV_CLOCK_INC})
ADD_LIBRARY(NRF_DRV_CLOCK STATIC ${NRF_SDK_DRV}/src/nrfx_clock.c ${NRF_SDK_DRV}/include/nrfx_clock.h)

target_include_directories(NRF_DRV_CLOCK_LEGACY PUBLIC ${NRF_SDK_DRV}/include)

ADD_LIBRARY(FreeRTOS_lib STATIC ${FREERTOS_SOURCES})

add_dependencies(FreeRTOS_lib NRF_DRV_CLOCK_LEGACY)
add_dependencies(NRF_DRV_CLOCK_LEGACY NRF_DRV_CLOCK)


target_include_directories(NRF_DRV_CLOCK PUBLIC ${NRF_SDK_DRV}/include)
target_include_directories(NRF_DRV_CLOCK PUBLIC ".")
target_include_directories(FreeRTOS_lib PUBLIC ${NRF_SDK_DRV_LEGACY})
target_include_directories(FreeRTOS_lib PUBLIC ${NRF_SDK_DRV}/include)
