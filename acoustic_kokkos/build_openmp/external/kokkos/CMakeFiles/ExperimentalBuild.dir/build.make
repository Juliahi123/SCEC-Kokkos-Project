# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.23.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.23.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/mengxiang/Desktop/acoustic_kokkos

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/mengxiang/Desktop/acoustic_kokkos/build_openmp

# Utility rule file for ExperimentalBuild.

# Include any custom commands dependencies for this target.
include external/kokkos/CMakeFiles/ExperimentalBuild.dir/compiler_depend.make

# Include the progress variables for this target.
include external/kokkos/CMakeFiles/ExperimentalBuild.dir/progress.make

external/kokkos/CMakeFiles/ExperimentalBuild:
	cd /Users/mengxiang/Desktop/acoustic_kokkos/build_openmp/external/kokkos && /usr/local/Cellar/cmake/3.23.2/bin/ctest -D ExperimentalBuild

ExperimentalBuild: external/kokkos/CMakeFiles/ExperimentalBuild
ExperimentalBuild: external/kokkos/CMakeFiles/ExperimentalBuild.dir/build.make
.PHONY : ExperimentalBuild

# Rule to build all files generated by this target.
external/kokkos/CMakeFiles/ExperimentalBuild.dir/build: ExperimentalBuild
.PHONY : external/kokkos/CMakeFiles/ExperimentalBuild.dir/build

external/kokkos/CMakeFiles/ExperimentalBuild.dir/clean:
	cd /Users/mengxiang/Desktop/acoustic_kokkos/build_openmp/external/kokkos && $(CMAKE_COMMAND) -P CMakeFiles/ExperimentalBuild.dir/cmake_clean.cmake
.PHONY : external/kokkos/CMakeFiles/ExperimentalBuild.dir/clean

external/kokkos/CMakeFiles/ExperimentalBuild.dir/depend:
	cd /Users/mengxiang/Desktop/acoustic_kokkos/build_openmp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/mengxiang/Desktop/acoustic_kokkos /Users/mengxiang/Desktop/acoustic_kokkos/external/kokkos /Users/mengxiang/Desktop/acoustic_kokkos/build_openmp /Users/mengxiang/Desktop/acoustic_kokkos/build_openmp/external/kokkos /Users/mengxiang/Desktop/acoustic_kokkos/build_openmp/external/kokkos/CMakeFiles/ExperimentalBuild.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : external/kokkos/CMakeFiles/ExperimentalBuild.dir/depend

