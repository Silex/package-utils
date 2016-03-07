# Package Utils

Interactive extensions for `package.el`

## Installation

The recommended way to install package-utils is through MELPA.

Otherwise, simply add `package-utils.el` to your load-path and then `(require 'package-utils)`.

## Overview

The following interactive functions are available:

* <kbd>M-x package-utils-upgrade-all</kbd>

  Upgrades all packages that can be upgraded (prefix argument: do no refresh packages).

* <kbd>M-x package-utils-upgrade-all-no-fetch</kbd>

  Upgrades all packages that can be upgraded without refreshing the packages list.

* <kbd>M-x package-utils-upgrade-by-name</kbd>

  Upgrades an installed package by name (prefix argument: do not refresh packages).

* <kbd>M-x package-utils-upgrade-by-name-no-fetch</kbd>

  Upgrades an installed package by name without refreshing the packages list.

* <kbd>M-x package-utils-remove-by-name</kbd>

  Removes an installed package by name.

* <kbd>M-x package-utils-list-upgrades</kbd>

  List all packages that can be upgraded (prefix argument: do no refresh packages).

* <kbd>M-x package-utils-list-packages-async</kbd>

  Like `package-list-packages`, but works asynchronously.

* <kbd>M-x package-utils-install-async</kbd>

  Like `package-install`, but works asynchronously.

## Contributions welcome!

Either as suggestions or as pull requests by opening tickets on the
[issue tracker](https://github.com/Silex/package-utils/issues).
