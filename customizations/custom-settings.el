;; My preferred custom settings

;; Shut up, bell!
(setq ring-bell-function 'ignore)

;; Enable selection overwrite
(delete-selection-mode 1)

;; Visual line mode
(global-visual-line-mode t)

(setq browse-url-browser-function 'browser-url-generic
      browser-url-generic-program "firefox")

;; Truncate long buffer names
(setq-default mode-line-buffer-identification (list -60 (propertized-buffer-identification "%12b")))

;; I better use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Move around windows
(global-set-key (kbd "C-c <left>")  'windmove-left)                 
(global-set-key (kbd "C-c <right>") 'windmove-right)                
(global-set-key (kbd "C-c <up>")    'windmove-up)                   
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; I'm familiar...
(setq inhibit-startup-screen t)

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

;; Show me the...numbers!
(display-line-numbers-mode 1)

(provide 'custom-settings)
