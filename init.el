;; Some of this follows keelerm84's approach because his dotfiles are
;; always well organized

;; I hate doing this, but how cask loads packages isn't fully
;; compatible with Emacs 27 and raises a warning about an
;; unnecessary call to package-initalize
;; This suppresses that for now (warnings can still be accessed in
;; the warnings buffer
(setq warning-minimum-level :error)
;; For Mac, you can uncomment the following line to set a default directory
;; (setq default-directory "/Users/<username>/")
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


;; Auto-reload buffer on file changes
(global-auto-revert-mode)

(defvar dotfiles-dir (file-name-directory
		      (or (buffer-file-name) load-file-name)))
(defvar misc-dir (expand-file-name "misc" dotfiles-dir))
(defvar customizations (expand-file-name "customizations" dotfiles-dir))


(defvar defuns-dir (expand-file-name "defuns" dotfiles-dir))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Custom settings should stay in a separate file
(setq custom-file (expand-file-name "custom.el" dotfiles-dir))
(when (file-exists-p custom-file)
    (load custom-file))

;; Write backup files to own directory
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))
(setq create-lockfiles nil)

(add-to-list 'load-path misc-dir)
(add-to-list 'load-path customizations)

;; Let's always delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Install packages
;; For Mac, comment the following line and uncomment the next
(require 'cask "~/.cask/cask.el")
;; (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(require 'custom-settings)
(require 'js-customizations)


