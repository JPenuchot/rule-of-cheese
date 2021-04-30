/// \file
/// Compile-time function selection - if_constexpr
///
/// Benchmark for compile-time function selection using if_constexpr

#include <type_traits>

#include <boost/preprocessor/repetition/repeat.hpp>

#define FOO_MAX 16

template <int N> constexpr int foo() {
    return N;
}

template <int N> constexpr int sum() {
  int i = 0;

#define CALL(z, n, var) i += foo<n>();

  BOOST_PP_REPEAT(BENCHMARK_SIZE, CALL, i);
  return i;
}
