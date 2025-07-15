(defun base-c-hook ()
"Common code for all cmode initializations"
    (development-minor-mode-hooks)
    (c-set-offset 'substatement-open 0)

    (setq c++-tab-always-indent t)
    (setq c-basic-offset 4)
    (setq c-indent-level 4)
    (setq c-basic-indent 4)
    (setq indent-tabs-mode nil)

    (clang-format-on-save-mode)
)

(add-hook 'c-mode-common-hook #'(lambda()
    (base-c-hook)
))

(add-hook 'c++-mode-hook #'(lambda()
    (base-c-hook)
))

(add-hook 'objc-mode-hook #'(lambda()
    (base-c-hook)
))

(provide 'cmode-settings)
