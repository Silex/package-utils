;;; package-utils.el --- Extensions for package.el

;; Author: Philippe Vaucher <philippe.vaucher@gmail.com>
;; URL: https://github.com/Silex/package-utils
;; Keywords: package, convenience
;; Version: 0.4.2
;; Package-Requires: ((async "1.6"))

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

(require 'package)

(defmacro package-utils-with-packages-list (packages &rest body)
  "List PACKAGES inside a `package-list-packages' buffer and evaluate BODY.

PACKAGES should be a list of packages, or t for all packages.
See the second argument to `package-menu--generate'."
  (declare (indent 1))
  `(with-temp-buffer
     (package-menu-mode)
     (package-menu--generate nil ,packages)
     ,@body))

(defun package-utils-upgradable-packages ()
  "Return the list of upgradable packages as a list of symbols."
  (package-utils-with-packages-list t
    (mapcar #'car (package-menu--find-upgrades))))

(defun package-utils-installed-packages ()
  "Return the list of installed packages as a list of symbols."
  (reverse (mapcar #'car package-alist)))

(defun package-utils-read-upgradable-package ()
  "Read the name of a package to upgrade."
  (intern (completing-read "Upgrade package: "
                           (mapcar #'symbol-name (package-utils-upgradable-packages))
                           nil
                           'require-match)))

(defun package-utils-upgradable-p (name)
  "Return true if NAME can be upgraded, nil otherwise."
  (not (null (member name (package-utils-upgradable-packages)))))

(defun package-utils-installed-p (name)
  "Return true if NAME is installed, nil otherwise."
  (not (null (member name (package-utils-installed-packages)))))

;;;###autoload
(defun package-utils-list-upgrades (&optional no-fetch)
  "List all packages that can be upgraded.

With prefix argument NO-FETCH, do not call `package-refresh-contents'."
  (interactive "P")
  (unless no-fetch
    (package-refresh-contents))
  (let ((packages (package-utils-upgradable-packages)))
    (if (null packages)
        (message "All packages are already up to date.")
      (message "Upgradable packages: %s" (mapconcat #'symbol-name packages ", ")))))

;;;###autoload
(defun package-utils-upgrade-all (&optional no-fetch)
  "Upgrade all packages that can be upgraded.

With prefix argument NO-FETCH, do not call `package-refresh-contents'."
  (interactive "P")
  (unless no-fetch
    (package-refresh-contents))
  (let ((packages (package-utils-upgradable-packages)))
    (if (null packages)
        (message "All packages are already up to date.")
      (package-utils-with-packages-list t
        (package-menu-mark-upgrades)
        (package-menu-execute t))
      (message "Upgraded packages: %s" (mapconcat 'symbol-name packages ", ")))))

;;;###autoload
(defun package-utils-upgrade-all-no-fetch ()
  "Upgrade all packages that can be upgraded without calling `package-refresh-contents' first."
  (interactive)
  (package-utils-upgrade-all t))

;;;###autoload
(defun package-utils-upgrade-by-name (name &optional no-fetch)
  "Upgrade the package NAME.

With prefix argument NO-FETCH, do not call `package-refresh-contents'."
  (interactive
   (progn
     (unless current-prefix-arg
       (package-refresh-contents))
     (list (package-utils-read-upgradable-package)
           current-prefix-arg)))
  (package-utils-with-packages-list (list name)
    (package-menu-mark-upgrades)
    (package-menu-execute t))
  (message "Package \"%s\" was upgraded." name))

;;;###autoload
(defun package-utils-upgrade-by-name-no-fetch (name)
  "Upgrade the package NAME, without calling `package-refresh-contents' first."
  (interactive (list (package-utils-read-upgradable-package)))
  (package-utils-upgrade-by-name name t))

;;;###autoload
(defun package-utils-remove-by-name (name)
  "Uninstall the package NAME."
  (interactive
   (list (intern (completing-read "Remove package: "
                                  (mapcar #'symbol-name (package-utils-installed-packages))
                                  nil
                                  'require-match))))
  (package-delete (cadr (assoc name package-alist))))

;;;###autoload
(defun package-utils-install-async (package)
  "Install PACKAGE asynchronously.

Contrary to `package-install', PACKAGE can only be a symbol."
  (interactive (list (car (eval (cadr (interactive-form 'package-install))))))
  (require 'async)
  (async-start
   `(lambda ()
      ,(async-inject-variables "^package-archives$")
      ;; Initialize the package system if necessary.
      (package-initialize t)
      (package-install ',package))
   `(lambda (result)
      (package-initialize nil)
      (message "%s installed" ',package))))

(provide 'package-utils)

;;; package-utils.el ends here
