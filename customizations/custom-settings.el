;; My preferred custom settings

;; Changing some of the default settings...
;; Namely, quieting the bell, overwriting selections, spaces instead
;; of tabs, inhibiting the startup screen, line number mode, fill
;; column settings
(setq ring-bell-function 'ignore)
(delete-selection-mode 1)
(global-visual-line-mode t)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(global-linum-mode t)

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Set the browser for, e.g., following links in org mode files
(setq browse-url-browser-function 'browser-url-generic
      browser-url-generic-program "firefox")

;; Truncate long buffer names
(setq-default mode-line-buffer-identification
              (list -60 (propertized-buffer-identification "%12b")))

;; Move around windows
(global-set-key (kbd "C-c <left>")  'windmove-left)                 
(global-set-key (kbd "C-c <right>") 'windmove-right)                
(global-set-key (kbd "C-c <up>")    'windmove-up)                   
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; helm mode settings
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Theme settings
(require 'moe-theme)
(load-theme 'manoj-dark)
(powerline-default-theme)
(setq powerline-height 20)
(set-face-attribute 'mode-line nil
                    :box "blue")
(setq powerline-image-apple-rgb nil)
(setq powerline-gui-use-vcs-glyph t)


;; Let me see the markdown
(setq markdown-command "pandoc")

;; Python mode
(elpy-enable)
;; For large files with inconsistent indentation,
;; Emacs may incorrectly guess the indentation
(setq python-indent-guess-indent-offset nil)
(setq python-indent-offset 4)
(setq elpy-rpc-ignored-buffer-size 1024000)

;; Org-mode
(setq org-todo-keywords
      '((sequence "TODO" "IN PROGRESS" "ON HOLD" "IN REVIEW" "DONE")))
(setq org-todo-keyword-faces
      '(
        ("TODO" . (:background "red" :weight bold))
        ("IN PROGRESS" . (:background "green" :weight bold))
        ("ON HOLD" . (:background "red" :weight bold))
        ("IN REVIEW" . (:background "cyan" :weight bold))
        ("DONE" . (:background "blue" :weight bold))
        )
      )
(setq org-tag-alist
      '(
        ("Feature" . ?f)
        ("Meeting" . ?m)
        )
      )
(setq org-tag-faces
      '(
        ("Feature" . "yellow")
        ("Meeting" . "purple")
        )
      )
(setq org-src-fontify-natively t)

;; This can be risky, but that's ok
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(provide 'custom-settings)
