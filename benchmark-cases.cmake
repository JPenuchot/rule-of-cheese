set(ROC_BENCHMARK_START 0)
set(ROC_BENCHMARK_STOP 32)
set(ROC_BENCHMARK_STEP 1)
set(ROC_BENCHMARK_ITERATIONS 9)

set(CTBENCH_TIME_TRACE_GRANULARITY 1)

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

ctbench_add_graph(numbered_structs-graph
  ${CMAKE_CURRENT_SOURCE_DIR}/configs/compare_config.json
  numbered_structs.template
  numbered_structs.non_template)

# ==============================================================================
# variadic_sum - Compute sum of constexpr integers

ctbench_add_benchmark(variadic_sum.expansion
  cases/variadic_sum/expansion.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_add_benchmark(variadic_sum.preunrolled_expansion
  cases/variadic_sum/expansion.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_add_benchmark(variadic_sum.recursive
  cases/variadic_sum/recursive.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_add_graph(variadic_sum-graph
  ${CMAKE_CURRENT_SOURCE_DIR}/configs/compare_config.json
  variadic_sum.expansion
  variadic_sum.recursive)

# ==============================================================================
# tag_dispatch - Dispatching function given a discrete number of properties

# TODO

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

ctbench_add_benchmark(function_selection.requires
  cases/function_selection/requires.cpp
  ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
  ${ROC_BENCHMARK_ITERATIONS})

ctbench_add_graph(function_selection-feature_comparison-graph
  ${CMAKE_CURRENT_SOURCE_DIR}/configs/function_selection/feature_comparison.json
  function_selection.enable_if
  function_selection.enable_if_t
  function_selection.if_constexpr
  function_selection.control
  function_selection.requires)

ctbench_add_graph(function_selection-front_back-graph
  ${CMAKE_CURRENT_SOURCE_DIR}/configs/function_selection/front_back.json
  function_selection.enable_if
  function_selection.enable_if_t
  function_selection.if_constexpr
  function_selection.control
  function_selection.requires)

ctbench_add_graph(function_selection-front-graph
  ${CMAKE_CURRENT_SOURCE_DIR}/configs/function_selection/front.json
  function_selection.enable_if
  function_selection.enable_if_t
  function_selection.if_constexpr
  function_selection.control
  function_selection.requires)

add_custom_target(function_selection-all-graph DEPENDS
  function_selection-feature_comparison-graph
  function_selection-front_back-graph
  function_selection-front-graph)

# ==============================================================================
# parameter_list_passing - Passing parameter packs

# TODO

# ==============================================================================
# if_constexpr_case_order - ...

# TODO

# ==============================================================================
# symbol_length - Studying impact of symbol length on compile time

# ctbench_add_benchmark(symbol_length.string_size
#   cases/function_selection/string_size.cpp
#   ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
#   ${ROC_BENCHMARK_ITERATIONS})

# ctbench_add_benchmark(symbol_length.imbrication
#   cases/function_selection/imbrication.cpp
#   ${ROC_BENCHMARK_START} ${ROC_BENCHMARK_STOP} ${ROC_BENCHMARK_STEP}
#   ${ROC_BENCHMARK_ITERATIONS})

# ==============================================================================
# enable_if vs requires
