project(benchmarks)

include(cmake/benchmarking.cmake)

# Benchmark targets
#add_benchmark_folder(hello_world)

add_benchmark_range("hello_range/" "hello_range-" "hello_range.cpp" 1 10 1)

add_custom_target(benchmark-graph
  COMMAND
  benchmark-grapher graphs
    "hello_world/"
    "hello_range/"
  DEPENDS brainfuck-benchmark
  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
