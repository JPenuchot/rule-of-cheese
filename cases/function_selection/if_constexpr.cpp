/// \file
/// Compile-time function selection - if_constexpr
///
/// Benchmark for compile-time function selection using if_constexpr

#include <boost/preprocessor/repetition/repeat.hpp>

#define FOO_MAX 16

template <int N> constexpr int foo() {

  // Generating FOO_MAX if constexpr cases
#define CASE(z, i, nop)                                                        \
  if constexpr (N % FOO_MAX == i) {                                            \
    return N * i;                                                              \
  }
  BOOST_PP_REPEAT(FOO_MAX, CASE, nop);
#undef CASE
}

int sum() {
  int i = 0;

  // Calling foo BENCHMARK_SIZE
#define CALL(z, n, var) i += foo<n>();
  BOOST_PP_REPEAT(BENCHMARK_SIZE, CALL, i);
#undef CALL

  return i;
}
