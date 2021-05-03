cmake_minimum_required(VERSION 3.18)
project(rule-of-cheese)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)

# First things first: checking for Clang
if(NOT ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
  message(FATAL_ERROR
    "C++ compiler has to be Clang. Current compiler: ${CMAKE_CXX_COMPILER_ID}")
endif(NOT ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")

# Including ctbench
include(cmake/ctbench.cmake)

include(benchmark-cases.cmake)
