;;; fg42-core.el --- a simple package                     -*- lexical-binding: t; -*-

;; Copyright (C) 2015  lxsameer

;; Author: Nic Ferrier <lxsameer@gnu.org>
;; Keywords: lisp fg42 IDE core
;; Version: 1.0.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Core libraries for FG42

;;; Code:
(message "Initializing FG42 Core")

;; Initial configuration ---------------------------------------------

;; Remove splash screen
(setq inhibit-splash-screen t)

;; scratch should be scratch
(setq initial-scratch-message nil)


;; Tramp configuration ---------------------------------------------
(setq tramp-default-method "ssh")

;; replace strings
(global-set-key (kbd "C-c M-s") 'replace-string)

;; Basic Key bindings
(global-set-key (kbd "\C-c m") 'menu-bar-mode)

;; Indentation ----------------------------------------------
;; Don't allow tab as indent
(setq-default indent-tabs-mode nil)

;; Default indent width
(setq tab-width 2)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Enhancements ---------------------------------------------

;; Global configurations
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq x-select-enable-clipboard t)
(column-number-mode t)

;; linum mode
(global-linum-mode)
(setq linum-format " %3d ")

(menu-bar-mode -1)
(show-paren-mode t)
(cua-selection-mode t)

;; Backup files ---------------------------------------------
;; Put them in one nice place if possible
(if (file-directory-p "~/.backup")
    (setq backup-directory-alist '(("." . "~/.backup")))
  (make-directory "~/.backup"))

(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 3    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too

;; get rid of yes-or-no questions - y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)

(setq my-path (file-name-directory load-file-name))
;; Load about submenu
(load-file (concat my-path "fg42-version.el"))
(load-file (concat my-path "fg42-about.el"))
(load-file (concat my-path "session-management.el"))
(load-file (concat my-path "custom.el"))

;; Inflections utility
(load-file (concat my-path "inflections.el"))


(provide 'fg42-core)
;;; fg42-core.el ends here
