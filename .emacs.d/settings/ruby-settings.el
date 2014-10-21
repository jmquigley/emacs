(require 'ruby-mode)

(add-hook 'ruby-mode-hook '(lambda()
    (development-minor-mode-hooks)
))

(provide 'ruby-settings)