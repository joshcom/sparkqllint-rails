[![Build Status](https://travis-ci.org/joshcom/sparkqllint-rails.png?branch=master)](https://travis-ci.org/joshcom/sparkqllint-rails)

SparkQL Lint
============
A simple Rails app that, when you provide a SparkQL <tt>_filter</tt> string, tells you if it is valid or not.

This checks syntax, not semantics, so if you include a field that does not exist for a given resource in your SparkQL string, you will not be warned.

Build using the [SparkQL Gem](https://github.com/sparkapi/sparkql) for [Spark API](http://sparkplatform.com).

TODO
==========
- The error messages need lots of tweaking.  Currently, it dumps out what the sparkQL gem gives as an error message, although even before tweaks are made there the message this Rails app displays can be optimized as well.
- Allow the input text area to have a full URI with a filter parameter, already escaped or unescaped.  The app should then extract the _filter parameter in the string, unescape it if needed, and process the filter.  Extremely useful when a _filter problem is discovered from application logs that have the full URI in this format.
