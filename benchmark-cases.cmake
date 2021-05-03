set(ROC_BENCHMARK_START 0)
set(ROC_BENCHMARK_STOP 16)
set(ROC_BENCHMARK_STEP 1)

# ==============================================================================
# numbered_structs - Numbered structs

ctbench_add_benchmark(numbered_structs.template
  cases/numbered_structs/template.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

ctbench_add_benchmark(numbered_structs.non_template
  cases/numbered_structs/non_template.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

ctbench_add_graphs(numbered_structs-graph
  numbered_structs.template
  numbered_structs.non_template)

# ==============================================================================
# variadic_sum - Compute sum of constexpr integers

ctbench_add_benchmark(variadic_sum.expansion
  cases/variadic_sum/expansion.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

ctbench_add_benchmark(variadic_sum.recursive
  cases/variadic_sum/recursive.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

ctbench_add_graphs(variadic_sum-graph
  variadic_sum.expansion
  variadic_sum.recursive)

# ==============================================================================
# function_selection - Compile-time function dispatch

ctbench_add_benchmark(function_selection.enable_if
  cases/function_selection/enable_if.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

ctbench_add_benchmark(function_selection.enable_if_t
  cases/function_selection/enable_if_t.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

ctbench_add_benchmark(function_selection.if_constexpr
  cases/function_selection/if_constexpr.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

ctbench_add_benchmark(function_selection.control
  cases/function_selection/control.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

ctbench_add_graphs(function_selection-graph
  function_selection.enable_if
  function_selection.enable_if_t
  function_selection.if_constexpr
  function_selection.control)

# ==============================================================================

add_custom_target(all-graphs DEPENDS
  numbered_structs-graph
  variadic_sum-graph
  function_selection-graph)