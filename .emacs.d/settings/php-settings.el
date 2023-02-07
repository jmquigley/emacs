;;(require 'php-mode)

(add-hook 'php-mode-hook #'(lambda()
    (development-minor-mode-hooks)
))

(provide 'php-settings)
