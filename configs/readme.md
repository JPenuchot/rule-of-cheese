# ctbench configuration files

### `feature_comparison.json`

Uses `compare` to generate graphs comparing each of Clang's measurement
aggregate (`Total ExecuteCompiler`, `Total Frontend`, `Total Source`,
`Total ParseClass`, etc...)

### `front.json`

Uses `stack` to generate a graph for each benchmark case where all the frontend
time measurements are stacked.

### `front_back.json`

Uses `stack` to generate a graph for each benchmark case where `Total Frontend`
and `Total Backend` time measurements are stacked.
