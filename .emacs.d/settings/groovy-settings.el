(autoload 'groovy-mode "groovy-mode" "Mode for editing groovy source files" t)
(autoload 'grails-mode "grails-mode"
    "Minor mode for editing groovy source files in a grails project" t)
(add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.gradle$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
(autoload 'groovy-mode "groovy-mode" "Groovy mode." t)
(autoload 'run-groovy "inf-groovy" "Run an inferior Groovy process")
(autoload 'inf-groovy-keys "inf-groovy" "Set local key defs for inf-groovy in groovy-mode")

(add-hook 'groovy-mode-hook '(lambda ()
    (development-minor-mode-hooks)
    (inf-groovy-keys)
    (grails-mode 1)

    (setq inferior-groovy-mode-hook
        '(lambda() (setq groovy-home (getenv "GROOVY_HOME"))))
))

(provide 'groovy-settings)
