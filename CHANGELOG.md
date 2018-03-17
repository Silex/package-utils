# Changelog

## 1.0.0 (2018-03-17)

- Add `package-utils-upgrade-all-and-quit` function.
- Add `package-utils-upgrade-all-and-restart` function.

## 0.5.0 (2017-02-23)

- Remove async functions
- Add changelog
- Improve docstrings

## 0.4.2 (2016-11-14)

- Refactor using plain package.el implementation.
- Remove package-utils-list-packages-async.
- Improve package-utils-install-async interactive spec.

## 0.4.1 (2016-06-27)

- Update EPL version
- Fix malformed dependency header

## 0.4.0 (2016-03-07)

- New package-utils-list-packages-async function.
- New package-utils-install-async function.

## 0.3.0 (2015-01-26)

- Don't make an error when there's no packages to upgrade.
- Display which package was upgraded.
- Fix typos.
- Allow packages names as strings or symbols for API usage.

## 0.2.0 (2014-10-05)

- New api `package-utils-list-upgrades`
- Ability to avoid refreshing packages index for package-utils-upgrade*

## 0.1.0 (2014-08-30)

- package-upgrade-all
- package-upgrade-by-name
- package-remove-by-name
