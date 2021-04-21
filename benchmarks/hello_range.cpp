#include <boost/preprocessor/repetition/repeat.hpp>

#define DECL(z, n, text) text##n = n;

BOOST_PP_REPEAT(5, DECL, int x)
