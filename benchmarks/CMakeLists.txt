project(benchmarks)

include(cmake/benchmarking.cmake)

# ==============================================================================
# Rule of Chiel benchmarks
# ==============================================================================

add_benchmark_range("00_sfinae/"
  "00_sfinae-"
  "00_sfinae.cpp"
  1 256 1)

add_benchmark_range("01_function_template_instantiation/"
  "01_function_template_instantiation-"
  "01_function_template_instantiation.cpp"
  1 256 1)

add_benchmark_range("02_type_instantiation/"
  "02_type_instantiation-"
  "02_type_instantiation.cpp"
  1 256 1)

add_benchmark_range("03_alias_call/"
  "03_alias_call-"
  "03_alias_call.cpp"
  1 256 1)

add_benchmark_range("04_type_parameter_addition/"
  "04_type_parameter_addition-"
  "04_type_parameter_addition.cpp"
  1 256 1)

add_benchmark_range("05_alias_call_parameter_addition/"
  "05_alias_call_parameter_addition-"
  "05_alias_call_parameter_addition.cpp"
  1 256 1)

add_benchmark_range("06_memoized_type_lookup/"
  "06_memoized_type_lookup-"
  "06_memoized_type_lookup.cpp"
  1 256 1)

add_custom_target(benchmark-graph
  COMMAND
  benchmark-grapher graphs
    "00_sfinae/"
    "01_function_template_instantiation/"
    "02_type_instantiation/"
    "03_alias_call/"
    "04_type_parameter_addition/"
    "05_alias_call_parameter_addition/"
    "06_memoized_type_lookup/"
  DEPENDS benchmark-all
  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
