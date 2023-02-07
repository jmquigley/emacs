(require 'python-environment)
(require 'jedi)

(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-hook 'python-mode-hook #'(lambda()
    (message "Loading python mode customizations")
    (development-minor-mode-hooks)

    (setq python-indent 4)
    (setq python-indent-offset 4)
    (auto-complete-mode t)
	(untabify (point-min) (point-max))
))

(provide 'python-settings)
