set(CMAKE_CXX_STANDARD 20)

set(ROC_BENCHMARK_START 0)
set(ROC_BENCHMARK_STOP 16)
set(ROC_BENCHMARK_STEP 1)

# ==============================================================================
# numbered_structs - Numbered structs

add_benchmark_range("numbered_structs.template"
  "cases/numbered_structs/template.cpp"
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

add_benchmark_range("numbered_structs.non_template"
  "cases/numbered_structs/non_template.cpp"
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

add_custom_target(numbered_structs-graph
  COMMAND grapher graphs
    "numbered_structs.template"
    "numbered_structs.non_template"
  DEPENDS
    "numbered_structs.template-all"
    "numbered_structs.non_template-all")

# ==============================================================================
# variadic_sum - Compute sum of constexpr integers

add_benchmark_range("variadic_sum.expansion"
  "cases/variadic_sum/expansion.cpp"
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

add_benchmark_range("variadic_sum.recursive"
  "cases/variadic_sum/recursive.cpp"
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

add_custom_target(variadic_sum-graph
  COMMAND grapher graphs
    "variadic_sum.expansion"
    "variadic_sum.recursive"
  DEPENDS
    "variadic_sum.expansion-all"
    "variadic_sum.recursive-all")

# ==============================================================================
# function_selection - Compile-time function dispatch

add_benchmark_range("function_selection.enable_if"
  "cases/function_selection/enable_if.cpp"
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

add_benchmark_range("function_selection.enable_if_t"
  "cases/function_selection/enable_if_t.cpp"
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

add_benchmark_range("function_selection.if_constexpr"
  "cases/function_selection/if_constexpr.cpp"
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

add_benchmark_range("function_selection.control"
  "cases/function_selection/control.cpp"
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP})

add_custom_target(function_selection-graph
  COMMAND grapher graphs
    "function_selection.enable_if"
    "function_selection.enable_if_t"
    "function_selection.if_constexpr"
    "function_selection.control"
  DEPENDS
    "function_selection.enable_if-all"
    "function_selection.enable_if_t-all"
    "function_selection.if_constexpr-all"
    "function_selection.control-all")


# ==============================================================================

add_custom_target(all-graphs DEPENDS
  numbered_structs-graph
  variadic_sum-graph
  function_selection-graph)