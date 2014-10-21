(add-hook 'emacs-lisp-mode-hook '(lambda()
    (development-minor-mode-hooks)
    (auto-complete-mode 1)
))

(provide 'lisp-settings)