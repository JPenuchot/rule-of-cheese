#pragma once

#include <ostream>

#include <grapher/core.hpp>

namespace grapher {

/// Outputs a bunch of categories as CSV.
std::ostream &to_csv(std::ostream &o, categories_t const &cats);

} // namespace grapher
