project(benchmarks)

include(cmake/benchmarking.cmake)

set(CMAKE_CXX_STANDARD 20)

# ==============================================================================
# numbered_structs - Numbered structs

add_benchmark_range("numbered_structs.template"
  "cases/numbered_structs/template.cpp"
  1 256 1)

add_benchmark_range("numbered_structs.non_template"
  "cases/numbered_structs/non_template.cpp"
  1 256 1)

# ==============================================================================
# variadic_sum - Compute sum of constexpr integers

add_benchmark_range("variadic_sum.expansion"
  "cases/variadic_sum/expansion.cpp"
  1 256 1)

add_benchmark_range("variadic_sum.recursive"
  "cases/variadic_sum/recursive.cpp"
  1 256 1)

# ==============================================================================
# function_selection - Compile-time function dispatch

add_benchmark_range("function_selection.enable_if"
  "cases/function_selection/enable_if.cpp"
  1 256 1)

add_benchmark_range("function_selection.enable_if_t"
  "cases/function_selection/enable_if_t.cpp"
  1 256 1)

add_benchmark_range("function_selection.if_constexpr"
  "cases/function_selection/if_constexpr.cpp"
  1 256 1)

add_benchmark_range("function_selection.control"
  "cases/function_selection/control.cpp"
  1 256 1)
