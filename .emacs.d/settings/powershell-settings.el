(add-to-list 'auto-mode-alist '("\\.ps1$" . powershell-mode))
(add-to-list 'auto-mode-alist '("\\.cmd$" . powershell-mode))

(add-hook 'powershell-mode-hook #'(lambda()
    (development-minor-mode-hooks)
))

(provide 'powershell-settings)
