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
(setq display-fill-column-indicator-column 80)
(global-display-fill-column-indicator-mode)

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

;; Theme settings
(require 'powerline)
(require 'moe-theme)
(setq moe-theme-highlight-buffer-id t)
(moe-theme-set-color 'blue)
(load-theme 'moe-dark t)
(powerline-moe-theme)

;; Let me see the markdown
(setq markdown-command "pandoc")

;; Python mode
(elpy-enable)


(provide 'custom-settings)
