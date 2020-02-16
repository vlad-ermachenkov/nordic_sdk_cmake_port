###############################################################################
#Need to clarify how this feature works
set(LTO_OPT "-flto")
###############################################################################
if (NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE Debug CACHE STRING "Default build type is ${CMAKE_BUILD_TYPE}" FORCE)
	message("Default build type is ${CMAKE_BUILD_TYPE}")
endif(NOT CMAKE_BUILD_TYPE) 

###############################################################################
set(CMAKE_C_FLAGS_DEBUG "-Og -g3" CACHE INTERNAL "C Compiler options for debug build")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g3" CACHE INTERNAL "C++ Compiler options for debug build")
set(CMAKE_ASM_FLAGS_DEBUG "-g3" CACHE INTERNAL "ASM Compiler options for debug build")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "" CACHE INTERNAL "Linker options for debug build")
###############################################################################
set(CMAKE_C_FLAGS_RELEASE "-O3 ${LTO_OPT}" CACHE INTERNAL "C Compiler options for release build")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 ${LTO_OPT}" CACHE INTERNAL "C++ Compiler options for release build")
set(CMAKE_ASM_FLAGS_RELEASE "" CACHE INTERNAL "ASM Compiler options for release build")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${LTO_OPT}" CACHE INTERNAL "Linker options for release build")
###############################################################################
set(CMAKE_C_FLAGS_RELWITHDEBINFO "-Og -g3" CACHE INTERNAL "C Compiler options for release with debug info build")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-Og -g3" CACHE INTERNAL "C++ Compiler options for release with debug info build")
set(CMAKE_ASM_FLAGS_RELWITHDEBINFO "-g3" CACHE INTERNAL "ASM Compiler options for release with debug info build")
set(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "" CACHE INTERNAL "Linker options for release with debug info build")
###############################################################################
set(CMAKE_C_FLAGS_MINSIZEREL "-Os ${LTO_OPT}" CACHE INTERNAL "C Compiler options for min size release build")
set(CMAKE_CXX_FLAGS_MINSIZEREL "-Os ${LTO_OPT}" CACHE INTERNAL "C++ Compiler options for min size release build")
set(CMAKE_ASM_FLAGS_MINSIZEREL "" CACHE INTERNAL "ASM Compiler options for min size release build")
set(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "${LTO_OPT}" CACHE INTERNAL "Linker options for min size release build")