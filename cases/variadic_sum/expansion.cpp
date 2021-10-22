#include <boost/preprocessor/repetition/enum.hpp>

#define TEXT(z, n, text)                                                       \
  text<n> {}

template <typename... Ts> auto print(Ts const &...) {
  return (0 + ... + Ts::value);
}

template <unsigned int N> struct some_struct {
  static constexpr unsigned int value = N;
};

void foo() { print(BOOST_PP_ENUM(BENCHMARK_SIZE, TEXT, some_struct)); }
