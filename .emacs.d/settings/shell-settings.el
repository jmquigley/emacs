(add-to-list 'auto-mode-alist '("\\.alias$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bashrc$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash_login$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash_logoutOB$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash_profile" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.functions$" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.path" . sh-mode))

(add-hook 'sh-mode-hook '(lambda()
    (development-minor-mode-hooks)
))

(provide 'shell-settings)
