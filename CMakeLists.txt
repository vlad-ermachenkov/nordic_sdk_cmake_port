cmake_minimum_required(VERSION 3.6)

#Must be enabled before project() 
set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake")

enable_language(ASM)
enable_language(C)

project(nrf_test)

#include common compiler/linker settings
include(build_options.cmake)
include(compiler_setup.cmake)
include(board.cmake)

ADD_EXECUTABLE(${CMAKE_PROJECT_NAME}.elf ${board_src_list})

ADD_CUSTOM_COMMAND(TARGET ${CMAKE_PROJECT_NAME}.elf POST_BUILD COMMAND ${CMAKE_OBJCOPY} ARGS -Oihex ${CMAKE_PROJECT_NAME}.elf ${CMAKE_PROJECT_NAME}.hex)
ADD_CUSTOM_COMMAND(TARGET ${CMAKE_PROJECT_NAME}.elf POST_BUILD COMMAND ${CMAKE_OBJCOPY} ARGS -Obinary ${CMAKE_PROJECT_NAME}.elf ${CMAKE_PROJECT_NAME}.bin)
ADD_CUSTOM_COMMAND(TARGET ${CMAKE_PROJECT_NAME}.elf POST_BUILD COMMAND ${CMAKE_STRIP} ARGS -s ${CMAKE_PROJECT_NAME}.elf -o ${CMAKE_PROJECT_NAME}_stripped.elf)

ADD_CUSTOM_COMMAND(TARGET ${CMAKE_PROJECT_NAME}.elf POST_BUILD COMMAND ${CMAKE_SIZE} ARGS ${CMAKE_PROJECT_NAME}.elf)
