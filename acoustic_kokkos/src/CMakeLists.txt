find_package(PkgConfig REQUIRED)

# do we need to detect hwloc using pkg-config ?
if (Kokkos_ENABLE_HWLOC)
  pkg_check_modules(HWLOC REQUIRED IMPORTED_TARGET hwloc)
endif()

#
# define a macro to build an executable
#
macro(build_exec name)

  # define executable name
  if (Kokkos_ENABLE_CUDA)
    set(EXE_NAME "${name}.cuda")
  elseif(Kokkos_ENABLE_HIP)
    set(EXE_NAME "${name}.hip")
  elseif(Kokkos_ENABLE_SYCL)
    set(EXE_NAME "${name}.sycl")
  elseif(Kokkos_ENABLE_OPENMP_TARGET)
    set(EXE_NAME "${name}.openmp_target")
  elseif(Kokkos_ENABLE_OPENMP)
    set(EXE_NAME "${name}.openmp")
  elseif(Kokkos_ENABLE_PTHREAD)
    set(EXE_NAME "${name}.pthread")
  else()
    set(EXE_NAME "${name}.serial")
  endif()

  # define how to build and link
  add_executable(${EXE_NAME} "")

  # define list of source files
  target_sources(${EXE_NAME}
    PRIVATE
    ${name}.cpp)

  # add timer
  if (Kokkos_ENABLE_OPENMP)
    target_sources(${EXE_NAME}
      PRIVATE
      OpenMPTimer.cpp)
  elseif (NOT Kokkos_ENABLE_CUDA)
    target_sources(${EXE_NAME}
      PRIVATE
      SimpleTimer.cpp)
  endif()

  target_link_libraries(${EXE_NAME} PRIVATE Kokkos::kokkos)
  if (Kokkos_ENABLE_HWLOC)
    target_link_libraries(${EXE_NAME} PRIVATE PkgConfig::HWLOC)
  endif()

endmacro(build_exec)

####################################################

build_exec(acoustic_kokkos)