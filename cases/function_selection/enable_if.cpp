/// \file
/// Compile-time function selection - enable_if
///
/// Benchmark for compile-time function selection using enable_if

#include <boost/preprocessor/repetition/repeat.hpp>

#define FOO_MAX 16

template <bool, typename T> struct enable_if {};
template <typename T> struct enable_if<true, T> { using type = T; };
template <typename T> struct enable_if<false, T> {};

#define DECL(z, i, nope)                                                       \
  template <int N>                                                             \
  constexpr typename enable_if<N % FOO_MAX == i, int>::type foo() {            \
    return N * i;                                                              \
  }

BOOST_PP_REPEAT(BENCHMARK_SIZE, DECL, FOO_MAX);

template <int N> constexpr int sum() {
  int i;

#define CALL(z, n, nop) i += foo<n>();

  BOOST_PP_REPEAT(BENCHMARK_SIZE, CALL, i);
  return i;
}
