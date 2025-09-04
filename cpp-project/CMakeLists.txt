cmake_minimum_required(VERSION 3.31)
project(hello) # This determines the name of the compiled binary.

# CMake generates a compile_commands.json which can be used by clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS ON) 

# C++ source files relative to src/
set(SRC
  main.cpp # Add your source files below
)

# This list is just SRC with each item having "src/" prepended.
# SRC_PATHS = SRC.map(path => "src/" + path)
set(SRC_PATHS "")  # Empty list to store results
foreach(path IN LISTS SRC)
    list(APPEND SRC_PATHS "src/${path}")
endforeach()

add_executable("${PROJECT_NAME}" ${SRC_PATHS})
target_compile_features("${PROJECT_NAME}" PRIVATE cxx_std_23) # Set the C++ standard to use

# From a .cpp in any subdirectory of src/, allow doing
# ```cpp
# #include "foo/bar/baz.hpp"
# ```
# This is like adding the flag -Isrc/
target_include_directories("${PROJECT_NAME}" 
   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src
)
