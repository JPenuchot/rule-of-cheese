#include <boost/preprocessor/repetition/repeat.hpp>

#define GEN_STRUCT(z, n, text)                                                 \
  struct s_##n {                                                               \
    static constexpr auto value = n;                                           \
  };

BOOST_PP_REPEAT(BOOST_PP_LIMIT_REPEAT, GEN_STRUCT, int x)
