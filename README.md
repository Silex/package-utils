# Package Utils

Interactive extensions for `package.el`

## Installation

The recommended way to install package-utils is through MELPA.

Otherwise, simply add `package-utils.el` to your load-path and then `(require 'package-utils)`.

## Overview

The following interactive functions are available:

 Function                                    | Description
---------------------------------------------|-------------------------------------------------------------------------------------
<kbd>M-x package-utils-upgrade-all</kbd>     | upgrades all packages that can be upgraded (prefix argument: do no refresh packages)
<kbd>M-x package-utils-upgrade-by-name</kbd> | upgrades an installed package by name (prefix argument: do not refresh packages)
<kbd>M-x package-utils-remove-by-name</kbd>  | removes an installed package by name

## Contributions welcome!

Either as suggestions or as pull requests by opening tickets on the
[issue tracker](https://github.com/Silex/package-utils/issues).
