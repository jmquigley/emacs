(add-hook 'emacs-lisp-mode-hook #'(lambda()
    (development-minor-mode-hooks)
    (setq indent-tabs-mode nil)
    (setq tab-width 4)
))

(provide 'lisp-settings)
