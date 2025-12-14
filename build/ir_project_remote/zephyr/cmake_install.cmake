# Install script for directory: C:/ncs/v3.0.2/zephyr

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/Zephyr-Kernel")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "C:/ncs/toolchains/0b393f9e1b/opt/zephyr-sdk/arm-zephyr-eabi/bin/arm-zephyr-eabi-objdump.exe")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/zephyr/arch/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/zephyr/lib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/zephyr/soc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/zephyr/boards/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/zephyr/subsys/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/zephyr/drivers/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/nrf/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/hostap/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/mcuboot/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/mbedtls/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/trusted-firmware-m/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/cjson/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/azure-sdk-for-c/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/cirrus-logic/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/openthread/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/suit-processor/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/memfault-firmware-sdk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/canopennode/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/chre/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/lz4/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/nanopb/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/zscilib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/cmsis/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/cmsis-dsp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/cmsis-nn/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/fatfs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/hal_nordic/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/hal_st/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/hal_tdk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/hal_wurthelektronik/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/liblc3/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/libmetal/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/littlefs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/loramac-node/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/lvgl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/mipi-sys-t/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/nrf_wifi/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/open-amp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/percepio/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/picolibc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/segger/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/tinycrypt/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/uoscore-uedhoc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/zcbor/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/nrfxlib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/nrf_hw_models/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/modules/connectedhomeip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/zephyr/kernel/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/zephyr/cmake/flash/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/zephyr/cmake/usage/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/2.workspace/2.project/7.ACICT/2.sorce_code/ir_project_remote/build/ir_project_remote/zephyr/cmake/reports/cmake_install.cmake")
endif()

