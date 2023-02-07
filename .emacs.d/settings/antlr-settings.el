(require 'antlr-mode)

(add-to-list 'auto-mode-alist '("\\.g4" . antlr-mode))

(add-hook 'antlr-mode-hook #'(lambda()
    (development-minor-mode-hooks)
))

(provide 'antlr-settings)
