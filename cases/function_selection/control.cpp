/// \file
/// Compile-time function selection - control
///
/// No function selection, just here for the sake of comparison.

#include <boost/preprocessor/repetition/repeat.hpp>

#define FOO_MAX 16

// Single fallthrough case
template <int N> constexpr int foo() { return N; }

int sum() {
  int i = 0;

  // Calling foo<n>(), BENCHMARK_SIZE times
#define CALL(z, n, var) i += foo<n>();
  BOOST_PP_REPEAT(BENCHMARK_SIZE, CALL, i);
#undef CALL

  return i;
}
