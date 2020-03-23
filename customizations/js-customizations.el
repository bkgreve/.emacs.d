(defun setup-tide-mode ()
  "Setup function for tide."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(setq company-tooltip-align-annotations t)

(add-hook 'js-mode-hook #'setup-tide-mode)
;; TODO: standardx only works when installed locally
;; Figure out a way to indicate local installations of it
(setq flycheck-javascript-standard-executable "/home/bkgreve/run-cal/node_modules/standardx/bin/cmd.js")
(add-hook 'js-mode-hook 'prettier-js-mode)


(setq prettier-js-args '(
  "--trailing-comma" "all"
  "--single-quote" "true"
  "--jsx-single-quote" "true"
  "--jsx-bracket-same-line" "true"
  "--print-width" "100"
  ))

(provide 'js-customizations)
