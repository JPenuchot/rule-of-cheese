project(benchmarks)

set(CMAKE_CXX_STANDARD 20)

include(cmake/benchmarking.cmake)

# ==============================================================================
# Rule of Chiel benchmarks
# ==============================================================================

# add_benchmark_range("00_sfinae"
#   "chiel/00_sfinae.cpp"
#   16 256 16)

# add_benchmark_range("01_no_sfinae"
#   "chiel/01_no_sfinae.cpp"
#   16 256 16)

# add_benchmark_range("10_function_template_instantiation"
#   "chiel/10_function_template_instantiation.cpp"
#   16 256 16)

# add_benchmark_range("20_type_instantiation"
#   "chiel/20_type_instantiation.cpp"
#   16 256 16)

# add_benchmark_range("30_alias_call"
#   "chiel/30_alias_call.cpp"
#   16 256 16)

# add_benchmark_range("40_type_parameter_addition"
#   "chiel/40_type_parameter_addition.cpp"
#   16 256 16)

# add_benchmark_range("50_alias_call_parameter_addition"
#   "chiel/50_alias_call_parameter_addition.cpp"
#   16 256 16)

# add_benchmark_range("60_memoized_type_lookup"
#   "chiel/60_memoized_type_lookup.cpp"
#   16 256 16)

add_benchmark_range("core.variadic_sum.expansion"
  "core/variadic_sum.expansion.cpp"
  1 256 1)

add_benchmark_range("core.variadic_sum.recursive"
  "core/variadic_sum.recursive.cpp"
  1 256 1)

add_benchmark_range("core.function_selection.enable_if"
  "core/function_selection.enable_if.cpp"
  1 256 1)

add_benchmark_range("core.function_selection.if_constexpr"
  "core/function_selection.if_constexpr.cpp"
  1 256 1)
