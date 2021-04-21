#include <algorithm>
#include <iostream>
#include <string>

#include <grapher/display.hpp>
#include <sciplot/sciplot.hpp>

// Feature list:
// - execute_compiler
// - frontend
// - source
// - instantiate_function
// - parse_class
// - instantiate_class
// - backend
// - opt_module
// - parse_template
// - opt_function
// - run_pass
// - per_module_passes
// - perform_pending_instantiations
// - run_loop_pass
// - code_gen_passes
// - code_gen_function
// - per_function_passes

namespace grapher {

sciplot::Plot make_plot(category_t const &cat) {
  namespace sp = sciplot;

  auto const measures = {
      // execute_compiler_v,
      // frontend_v,
      // backend_v,
      // run_pass_v,
      source_v,
      instantiate_function_v,
      parse_class_v,
      instantiate_class_v,
      opt_module_v,
      parse_template_v,
      opt_function_v,
      per_module_passes_v,
      perform_pending_instantiations_v,
      run_loop_pass_v,
      code_gen_passes_v,
      code_gen_function_v,
      per_function_passes_v,
  };

  auto const &[name, entries] = cat;
  sp::Plot plot;

  constexpr std::size_t plot_w = 800;
  constexpr std::size_t plot_h = 400;

  plot.legend().atOutsideRightTop().title("Time scopes:");
  plot.size(plot_w, plot_h);
  plot.xlabel("Benchmark Size Factor");
  plot.ylabel("Time (µs)");
  plot.palette("spectral");

  using vec = std::vector<measure_t>;

  vec x;

  for (auto const &e : entries) {
    x.push_back(std::atoi(e.name.c_str()));
  }

  if (x.empty()) {
    return sp::Plot();
  }

  vec ylow(x.size());
  vec yhigh(x.size(), 0.);

  for (measure_kind_t measure_kind : measures) {
    // Previous high becomes new low
    std::swap(ylow, yhigh);

    // Summing up measurements
    std::transform(entries.begin(), entries.end(), ylow.begin(), yhigh.begin(),
                   [&](auto const &ehigh, auto const &mlow) {
                     return mlow + get_measure(ehigh, measure_kind);
                   });

    // Draw
    plot.drawWithVecs("filledcurves", x, ylow, yhigh)
        .label(std::string(get_measure_name(measure_kind)));
  }

  return plot;
}

void graph(categories_t const &cats, std::filesystem::path const &p) {
  namespace sp = sciplot;
  std::vector<sp::Plot> plots;

  for (auto const &cat : cats) {
    auto plot = make_plot(cat);
    plot.show();
    std::filesystem::create_directories(p);
    plot.save(p / (std::get<0>(cat) + ".svg"));
  }
}

} // namespace grapher
