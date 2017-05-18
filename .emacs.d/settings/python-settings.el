(require 'python-environment)
(require 'jedi)

; (elpy-enable)

(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-hook 'python-mode-hook '(lambda()
    (message "Loading python mode customizations")
    (development-minor-mode-hooks)
    (setq python-indent 4)
    (setq python-indent-offset 4)
    (setq indent-tabs-mode nil)
    (auto-complete-mode t)
    ;; (define-key python-mode-map (kbd "\C-c \\") 'py-indent-region)
    ;; (define-key python-mode-map (kbd "\C-j") 'join-line)
))

(provide 'python-settings)
