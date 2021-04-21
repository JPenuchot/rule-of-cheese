cmake_minimum_required(VERSION 3.18)
project(tooling)

include_directories("include/")
set(CMAKE_CXX_STANDARD 17)

# time-trace-wrapper
add_executable(time-trace-wrapper tools/time-trace-wrapper.cpp)

if(ROC_ENABLE_TESTING)
  add_executable(time-trace-wrapper-test-exec tests/time-trace-wrapper.cpp)
  add_test(NAME time-trace-wrapper-test COMMAND time-trace-wrapper-test-exec)
endif(ROC_ENABLE_TESTING)