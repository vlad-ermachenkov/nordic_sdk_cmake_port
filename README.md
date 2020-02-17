To compile cmake project:
```bash
cmake . -Bbuild
```
Where `build` is a build directory.

To build `Makefile` project:
```bash
cmake --build build/ --clean-first -- "-j8"
```
Where `build` is a `Makefile` build directory.\
`--clean-first` clean before building.\
`--` passes `-j8` command to the `Makefile`.\
Change `-j8` to your host number of a threads.

#### Environment variables
- ARM_GCC_COMPILER_DIR for gcc-arm-none-eabi path
- NRF_SDK_DIR for SDK by Nordic Semiconductor.

WARNING. The only version of the SDK that was tested is 16.0.0 98a08e2.