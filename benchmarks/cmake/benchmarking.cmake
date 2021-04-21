### ============================================================================
### benchmarking.cmake
###
### Useful functions for benchmarking.
### ============================================================================

add_custom_target(benchmark-all)


## =============================================================================
## Creates a library target for a file
## and extracts the compilation time trace file.
## - target_name: Name of the benchmark target
## - output: Time trace output path
## - file: Source file
## - size: Sets BENCHMARK_SIZE define (can be something else than a number)
##   See: https://cmake.org/cmake/help/latest/prop_tgt/COMPILE_DEFINITIONS.html

function(add_compile_benchmark target_name output source size)
  add_library(${target_name} OBJECT EXCLUDE_FROM_ALL ${source})
  target_include_directories(${target_name} PUBLIC "../include")
  add_dependencies(${target_name} time-trace-wrapper)

  # Setting time-trace-wrapper as a compiler launcher
  set_target_properties(${target_name}
    PROPERTIES
      CXX_COMPILER_LAUNCHER
        "${CMAKE_BINARY_DIR}/tooling/time-trace-wrapper;${output}")

  set_target_properties(${target_name}
    PROPERTIES
      COMPILE_DEFINITIONS "BENCHMARK_SIZE=${size}")

  add_dependencies(benchmark-all ${target_name})
endfunction(add_compile_benchmark)


## =============================================================================
## Add a benchmark range for a given source.
## - output: Output folder path
## - prefix: Prefix for target name
## - source: Source file
## - begin: Size iteration begin
## - end: Size iteration end
## - step: Size iteration step

function(add_benchmark_range output prefix source begin end step)
  add_custom_target("${prefix}all")
  add_dependencies(benchmark-all "${prefix}all")

  file(MAKE_DIRECTORY ${output})
  foreach(size RANGE ${begin} ${end} ${step})
    add_compile_benchmark(
      "${prefix}${size}"
      "${output}/${size}.json"
      "${source}"
      "${size}")
    add_dependencies("${prefix}all" "${prefix}${size}")
  endforeach()
endfunction(add_benchmark_range)


## =============================================================================
## Add a whole folder to benchmark targets
## - source: Input path for sources
## - dest: Output path for time trace reports

function(add_benchmark_folder sources dest)
  file(GLOB_RECURSE benchmark_sources "${sources}/*")
  foreach(benchmark_source ${benchmark_sources})
    # Generating benchmark target name and output filename

    # TODO: Making stems actually readable
    # https://cmake.org/cmake/help/latest/command/cmake_path.html
    string(MD5 ${benchmark_source} stem)
    string(REPLACE ".cpp" ".json" benchmark_output ${benchmark_source})

    # Adding benchmark target
    add_compile_benchmark(
      "benchmark_${stem}"
      ${benchmark_output}
      ${benchmark_source}
      0)
  endforeach(benchmark_source)
endfunction(add_benchmark_folder)
