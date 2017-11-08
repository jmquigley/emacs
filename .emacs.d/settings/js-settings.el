(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook '(lambda()
    (development-minor-mode-hooks)
    (setq js2-basic-offset 4)
    (setq indent-tabs-mode t)
    (setq js2-bounce-indent-p t)
))

(add-hook 'js-mode-hook '(lambda()
    (development-minor-mode-hooks)
    (setq indent-tabs-mode t)
))

(provide 'js-settings)
