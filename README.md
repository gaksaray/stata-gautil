# gautil

This is a collection of Stata modules that I use across several of my projects.

## Installation

To install directly within Stata, use the following command:
```stata
* capture ado uninstall gautil
local github "https://raw.githubusercontent.com"
net install gautil, from(`github'/gaksaray/stata-gautil/master)
```

## Content
- `compformat`: Compress (shorten) variable formats
- `dichotomize`: Dichotomize a categorical variable
- `maxvarlen`: Calculate maximum character length of variables names or labels
- `purge`: Purge (minimize) memory while preserving data