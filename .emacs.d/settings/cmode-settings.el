(add-hook 'c-mode-common-hook '(lambda()
    (development-minor-mode-hooks)
    (c-set-offset 'substatement-open 0)

    (setq c++-tab-always-indent t)
    (setq c-basic-offset 4)
    (setq c-indent-level 4)
    (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
    (setq tab-width 4)
    (setq indent-tabs-mode t)

    (setq c-basic-indent 4)
    (setq-default indent-tabs-mode nil)

    (ggtags-mode 1)
))

(add-hook 'c++-mode-hook '(lambda()
))

(add-hook 'objc-mode-hook '(lambda()
))

(provide 'cmode-settings)
