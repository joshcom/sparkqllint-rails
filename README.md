SparkQL Lint
============
A simple Rails app that, when you provide a SparkQL <tt>_filter</tt> string, tells you if it is valid or not.

This checks syntax, not semantics, so if you include a field that does not exist for a given resource in your SparkQL string, you will not be warned.

Build using the [SparkQL Gem](https://github.com/sparkapi/sparkql) for (Spark API)[http://sparkplatform.com].
