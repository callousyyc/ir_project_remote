cmake_minimum_required(VERSION 3.20.0)
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(ir_project)

# C++ 支持
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti -fno-exceptions")

# 核心源文件
target_sources(app PRIVATE
    src/main.cpp
    # src/driver/ZephyrIRReceiver.cpp
    # src/driver/ZephyrIRSender.cpp
    # src/protocols/ir_Panasonic.cpp
    src/protocols/ir_Haier.cpp
    src/driver/IRsend.cpp
    src/driver/IRutils.cpp
    # src/driver/IRrecv.cpp
    src/driver/ir_hal.c
)
target_include_directories(app PRIVATE src/shim
    src/driver
    src/protocols
)

# get_property(TOOLCHAIN_INC GLOBAL PROPERTY TOOLCHAIN_C_STANDARD_INCLUDE_DIRS)