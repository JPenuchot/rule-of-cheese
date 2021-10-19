# Rule of Cheese

Rule of Cheese is a collection of Clang compile-time benchmarks based on
[`ctbench`](https://github.com/jpenuchot/ctbench).

The main goal of this project is to evaluate and compare the compile-time cost
of C++ language features such as SFINAE or type alias, thus proving (or busting)
C++ compile-time rules of thumb such as the
[Rule of Chiel](https://www.youtube.com/watch?v=EtU4RDCCsiU&t=491s).

## Building

You might start with [`pyperf`'s system tuning guide](
https://pyperf.readthedocs.io/en/latest/system.html) to get more accurate
measurements.

```sh
mkdir build
cd build
CXX=clang++ CC=clang cmake -G Ninja ../ -DCMAKE_BUILD_TYPE=Release
```
NB: Using Make will check dependency for each and every of the 2000+ benchmark
repetitions, setting you back a minute or two every time you update a graph
configuration.

## Rule of Chiel

Descending cost of operation (taken from [here](
https://github.com/boostcon/cppnow_presentations_2017/blob/master/05-17-2017_wednesday/type_based_template_metaprogramming_is_not_dead__odin_holmes__cppnow_05-17-2017.pdf
)).

- SFINAE
- Instantiating a function template
- Instantiating a type
- Calling an alias
- Adding a parameter to a type
- Adding a parameter to an alias call
- Looking up a memoized type

## References

- [Rule of Chiel](https://www.youtube.com/watch?v=EtU4RDCCsiU&t=491s)
- [Metabench](https://github.com/ldionne/metabench)
- [Overhead of function signatures](https://www.youtube.com/watch?v=TyiiNVA1syk)

## Aknowledgements

- [Antoine Morrier](
https://discord.com/channels/535019053295861767/840639389453123594/846776592494886953)
  for asking about the performance impact of `if constexpr` case order
