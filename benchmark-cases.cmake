set(ROC_BENCHMARK_START 0)
set(ROC_BENCHMARK_STOP 16)
set(ROC_BENCHMARK_STEP 1)
set(ROC_BENCHMARK_ITERATIONS 1)

# ctbench_graph_category(category plotter config)
# ctbench_add_benchmark(name source begin end step iterations)

# ==============================================================================
# numbered_structs - Numbered structs

ctbench_add_benchmark(numbered_structs.template
  cases/numbered_structs/template.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_add_benchmark(numbered_structs.non_template
  cases/numbered_structs/non_template.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_graph_category(numbered_structs-graph
  stack
  ${CMAKE_CURRENT_SOURCE_DIR}/config.json
  numbered_structs.template
  numbered_structs.non_template)

# ==============================================================================
# variadic_sum - Compute sum of constexpr integers

ctbench_add_benchmark(variadic_sum.expansion
  cases/variadic_sum/expansion.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_add_benchmark(variadic_sum.recursive
  cases/variadic_sum/recursive.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_graph_category(variadic_sum-graph
  stack
  ${CMAKE_CURRENT_SOURCE_DIR}/config.json
  variadic_sum.expansion
  variadic_sum.recursive)

# ==============================================================================
# function_selection - Compile-time function dispatch

ctbench_add_benchmark(function_selection.enable_if
  cases/function_selection/enable_if.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_add_benchmark(function_selection.enable_if_t
  cases/function_selection/enable_if_t.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_add_benchmark(function_selection.if_constexpr
  cases/function_selection/if_constexpr.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_add_benchmark(function_selection.control
  cases/function_selection/control.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_graph_category(function_selection-graph
  stack
  ${CMAKE_CURRENT_SOURCE_DIR}/config.json
  function_selection.enable_if
  function_selection.enable_if_t
  function_selection.if_constexpr
  function_selection.control)
