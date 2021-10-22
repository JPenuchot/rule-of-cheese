/// \file
/// Compile-time function selection - enable_if_t
///
/// Benchmark for compile-time function selection using enable_if_t

#include <boost/preprocessor/repetition/repeat.hpp>

#define FOO_MAX 16

// enable_if_t implementation

template <bool, typename T> struct enable_if {};
template <typename T> struct enable_if<true, T> { using type = T; };
template <typename T> struct enable_if<false, T> {};

template <bool B, typename T>
using enable_if_t = typename enable_if<B, T>::type;

// Declaring 16 foo<int i>() instances for i % 16 = 0 ... 15
#define DECL(z, i, nope)                                                       \
  template <int N> constexpr enable_if_t<N % FOO_MAX == i, int> foo() {        \
    return N * i;                                                              \
  }
BOOST_PP_REPEAT(BENCHMARK_SIZE, DECL, FOO_MAX);
#undef DECL

int sum() {
  int i = 0;

  // Calling foo<n>() BENCHMARK_SIZE times
#define CALL(z, n, nop) i += foo<n>();
  BOOST_PP_REPEAT(BENCHMARK_SIZE, CALL, i);
#undef CALL

  return i;
}
