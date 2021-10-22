#include <boost/preprocessor/repetition/enum.hpp>

#define TEXT(z, n, text)                                                       \
  text<n> {}

auto sum() { return 0; }

template <typename T> auto sum(T const &) { return T::value; }

template <typename T, typename... Ts> auto sum(T const &, Ts const &...Elts) {
  return T::value + sum(Elts...);
}

template <unsigned int N> struct some_struct {
  static constexpr unsigned int value = N;
};

void foo() { sum(BOOST_PP_ENUM(BENCHMARK_SIZE, TEXT, some_struct)); }
