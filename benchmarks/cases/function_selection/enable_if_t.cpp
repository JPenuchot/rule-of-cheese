/// \file
/// Compile-time function selection - if_constexpr
///
/// Benchmark for compile-time function selection using enable_if

#include <type_traits>

#include <boost/preprocessor/repetition/repeat.hpp>

#define FOO_MAX 16

#define DECL(z, i, nope)                                                       \
  template <int N> constexpr std::enable_if_t<N % FOO_MAX == i, int> foo() {   \
    return N * i;                                                              \
  }

BOOST_PP_REPEAT(BENCHMARK_SIZE, DECL, FOO_MAX);

template <int N> constexpr int sum() {
  int i;

#define CALL(z, n, nop) i += foo<n>();

  BOOST_PP_REPEAT(BENCHMARK_SIZE, CALL, i);
  return i;
}
