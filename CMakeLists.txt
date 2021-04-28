cmake_minimum_required(VERSION 3.18)
project(rule-of-cheese)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)

option(ROC_ENABLE_TESTING "Enable testing." 0)

if(ROC_ENABLE_TESTING)
  enable_testing()
endif(ROC_ENABLE_TESTING)

add_subdirectory(tooling)
add_subdirectory(benchmark-grapher)

add_subdirectory(benchmarks)
