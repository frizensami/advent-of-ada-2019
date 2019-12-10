# Advent of Code in Ada + SPARK

## Overview
Advent of Code 2019, written in Ada + SPARK. The aim is to learn a new language as usual, with this year's focus being safety-critical systems programming.

**Ada** is a structured, statically typed, imperative, and object-oriented high-level computer programming language, extended from Pascal and other languages.


**SPARK** is a formally defined computer programming language based on the Ada programming language, intended for the development of high integrity software used in systems where predictable and highly reliable operation is essential.

## Structure of Codebase
- `day<N>.adb` is the runner file for the `N`th day's code which calls functions defined in that day's package.
- `day<N>pkg.ads` is the "header file" for the package containing the code for the `N`th day. SPARK contracts are mostly found here.
- `day<N>pkg.adb` is the "source file" containing the implementation code for the `N`th day's package. 

## Learning resources used for Ada + SPARK
- [Official docs for Ada](https://learn.adacore.com/courses/intro-to-ada/chapters/imperative_language.html)
- [Official docs for SPARK](https://learn.adacore.com/courses/intro-to-spark/chapters/01_Overview.html)
- [Wikibook on Ada Programming](https://en.wikibooks.org/wiki/Ada_Programming)
- [One-page SPARK tutorial](https://docs.adacore.com/spark2014-docs/html/ug/en/tutorial.html)
- [More comprehensive guide/reference for SPARK](https://docs.adacore.com/spark2014-docs/html/ug/en/spark_2014.html)
- [Reference blogpost on using Ada's Vector type with Unbounded strings. Useful for handling file input.](https://zhu-qy.blogspot.com/2012/06/ada-unbounded-string-and-vector.html?m=1)
