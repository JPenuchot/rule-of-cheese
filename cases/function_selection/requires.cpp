/// \file
/// Compile-time function selection - requires
///
/// Benchmark for compile-time function selection using requires

#include <boost/preprocessor/repetition/repeat.hpp>

#define FOO_MAX 16

#define DECL(z, i, nope)                                                       \
  template <int N>                                                             \
  requires(N % FOO_MAX == i) constexpr int foo() { return N * i; }

BOOST_PP_REPEAT(BENCHMARK_SIZE, DECL, FOO_MAX);

template <int N> constexpr int sum() {
  int i;

#define CALL(z, n, nop) i += foo<n>();

  BOOST_PP_REPEAT(BENCHMARK_SIZE, CALL, i);
  return i;
}
