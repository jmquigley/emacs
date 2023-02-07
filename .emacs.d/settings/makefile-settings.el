(add-hook 'makefile-mode-hook #'(lambda()
    (development-minor-mode-hooks)
))

(provide 'makefile-settings)
