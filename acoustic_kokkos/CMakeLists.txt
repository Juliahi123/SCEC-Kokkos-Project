# use minimum version required by Kokkos
cmake_minimum_required(VERSION 3.16)

project(acoustic_kokkos
  LANGUAGES CXX)

# always export compile commands database
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# C++17 is for Kokkos (to be able to use KOKKOS_CLASS_LAMBDA)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)

set(default_build_type "Release")
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS "Setting build type to '${default_build_type}' as none was specified.")
  set(CMAKE_BUILD_TYPE "${default_build_type}" CACHE
      STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
    "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

option(USE_SIMD_KOKKOS "Should we enable simd from kokkos" OFF)
option (USE_DOUBLE "build with double precision" ON)

# added flag
if (USE_DOUBLE)
  message("//Double precision is implemented")
  add_compile_options(-DUSE_DOUBLE)
endif()

if (DEBUG)
  message("//Turn on DEBUG option")
  add_compile_options(-DDEBUG)
endif()


#
# sources
#

# first build kokkos
add_subdirectory(external/kokkos)

# pass Kokkos include directories to our target application
include_directories(${Kokkos_INCLUDE_DIRS_RET})

# build the miniapp
add_subdirectory(src)


##################### PRINT CONFIGURE STATUS ######################
message("//===================================================")
message("  ${PROJECT_NAME} build configuration:")
message("//===================================================")
message("  C++ Compiler : ${CMAKE_CXX_COMPILER_ID} "
                         "${CMAKE_CXX_COMPILER_VERSION} "
                         "${CMAKE_CXX_COMPILER_WRAPPER}")
message("                 ${CMAKE_CXX_COMPILER}")
message("  Kokkos_ENABLE_OPENMP = ${Kokkos_ENABLE_OPENMP}")
message("  Kokkos_ENABLE_CUDA   = ${Kokkos_ENABLE_CUDA}")
if (Kokkos_ENABLE_CUDA)
  message("  Kokkos_ENABLE_CUDA_LAMBDA    = ${Kokkos_ENABLE_CUDA_LAMBDA}")
  message("  Kokkos_ENABLE_CUDA_CONSTEXPR = ${Kokkos_ENABLE_CUDA_CONSTEXPR}")
  message("  Kokkos_ENABLE_CUDA_UVM       = ${Kokkos_ENABLE_CUDA_UVM}")
  message("  Kokkos CUDA   flags          = ${KOKKOS_CUDA_OPTIONS}")
endif(Kokkos_ENABLE_CUDA)
message("  Kokkos_ENABLE_HWLOC  = ${Kokkos_ENABLE_HWLOC}")

if (Kokkos_ENABLE_CUDA)
  message("  CUDA Compiler      : ${CMAKE_CUDA_COMPILER}")
  message("  CUDA Compiler exec : ${CUDA_NVCC_EXECUTABLE}")
  message("  CUDA Compile flags : ${CUDA_NVCC_FLAGS}")
endif(Kokkos_ENABLE_CUDA)
