/// \file
/// Compile-time SFINAE benchmark case.

#include <boost/preprocessor/repetition/repeat.hpp>

template <unsigned int> struct some_struct {};

struct some_other_struct {};

#define INSTANTIATE(z, n, text)                                                \
  template <> struct some_struct<n> {};

#define USE(z, n, text) some_other_struct some_var_##n;

BOOST_PP_REPEAT(BENCHMARK_SIZE, INSTANTIATE, 0)

BOOST_PP_REPEAT(BOOST_PP_LIMIT_REPEAT, USE, 0)
