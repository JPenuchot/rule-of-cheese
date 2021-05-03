# Rule of Cheese

Going down the compiler rabbithole. Think [Metabench](
https://github.com/ldionne/metabench) but with more than just compile-times.

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

## Why `-ftime-trace`

- allows us to have tighter data

## `time-trace-wrapper`

## Notes on benchmarking

Get yourself a tight benchmarking environment, follow
[`pyperf`'s system tuning guide](
https://pyperf.readthedocs.io/en/latest/system.html).

You may also just run `sudo pyperf system tune`.
And close that web browser while you're at it.

## References

- [Rule of Chiel](https://www.youtube.com/watch?v=EtU4RDCCsiU&t=491s)
- [Metabench](https://github.com/ldionne/metabench)
- [Overhead of function signatures](https://www.youtube.com/watch?v=TyiiNVA1syk)
