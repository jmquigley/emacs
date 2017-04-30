(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

(add-hook 'html-mode-hook '(lambda()
    (development-minor-mode-hooks)
))

(provide 'html-settings)
