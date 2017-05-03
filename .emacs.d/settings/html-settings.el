(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

(add-hook 'html-mode-hook '(lambda()
    (development-minor-mode-hooks)
))

(add-hook 'css-mode-hook '(lambda()
    (development-minor-mode-hooks)
))

(add-hook 'scss-mode-hook '(lambda()
    (development-minor-mode-hooks)
))

(provide 'html-settings)
