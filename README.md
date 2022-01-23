# relpath.fish
Relative path for fish shell

## Installation

```fish
fisher install dangh/relpath.fish
```

## Usage

```fish
$ relpath /A/B/c/d /A/B/e/f
../../e/f

$ relpath /A/B /A
..

$ relpath /A /A
.

$ relpath /A /A/b/c
./b/c

```
