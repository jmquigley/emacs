(require 'python-environment)
(require 'pydoc-info)
(require 'company-jedi)

(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

(add-hook 'python-mode-hook #'(lambda()
    (message "Loading python mode customizations")
    (development-minor-mode-hooks)
    (add-to-list 'company-backends 'company-jedi)

    (setq python-indent 4)
    (setq python-indent-offset 4)
	(untabify (point-min) (point-max))
))

(provide 'python-settings)
