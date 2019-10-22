(require 'go-mode)

(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))

(add-hook 'go-mode-hook '(lambda()
    (development-minor-mode-hooks)
    (setq indent-tabs-mode t)
))

(provide 'go-settings)
