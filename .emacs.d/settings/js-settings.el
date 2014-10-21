(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq-default js2-basic-offset 4)

(add-hook 'js2-mode-hook '(lambda()
    (development-minor-mode-hooks)
))

(provide 'js-settings)