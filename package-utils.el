;;; package-utils.el --- Extensions for package.el

;; Author: Philippe Vaucher <philippe.vaucher@gmail.com>
;; URL: https://github.com/Silex/package-utils
;; Keywords: package, convenience
;; Version: 0.0.1
;; Package-Requires: ((epl "0.7"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; This library provides extensions for package.el
;;
;;; Code:

(require 'epl)

;;;###autoload
(defun package-upgrade-all ()
  "Upgrade all packages that can be upgraded."
  (interactive)
  (package-refresh-contents)
  (epl-upgrade))

(provide 'package-utils)

;;; package-utils.el ends here
