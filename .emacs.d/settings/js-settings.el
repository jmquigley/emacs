(require 'js2-mode)
(require 'prettier-js)

;; Opinionated settings for prettier
(setq-default prettier-js-args '(
    "--arrow-parens" "always"
    "--no-bracket-spacing"
    "--end-of-line" "lf"
    "--jsx-bracket-same-line" "true"
    "--tab-width" "4"
    "--use-tabs" "true"
))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook '(lambda()
    (development-minor-mode-hooks)
    (setq js2-basic-offset 4)
    (setq indent-tabs-mode t)
    (setq js2-bounce-indent-p t)
    (tabify (point-min) (point-max))
    (prettier-js-mode 1)
))

(add-hook 'web-mode-hook '(lambda()
    (development-minor-mode-hooks)
    (setq js2-basic-offset 4)
    (setq indent-tabs-mode t)
    (setq js2-bounce-indent-p t)
    (tabify (point-min) (point-max))
    (prettier-js-mode 1)
))

(add-hook 'js-mode-hook '(lambda()
    (development-minor-mode-hooks)
    (setq indent-tabs-mode t)
))

(provide 'js-settings)
