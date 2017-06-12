(require 'js2-mode)
(require 'rjsx-mode)

(defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1)
)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))

(add-to-list 'auto-mode-alist '("\\.ts$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.d\\.ts$" . typescript-mode))

(add-hook 'js2-mode-hook '(lambda()
    (development-minor-mode-hooks)
    (setq js2-basic-offset 4)
    (setq indent-tabs-mode t)
    (setq j2-bounce-indent-p t)
))

(add-hook 'js-mode-hook '(lambda()
    (development-minor-mode-hooks)
    (setq indent-tabs-mode t)
))

(add-hook 'rjsx-mode-hook '(lambda()
    (development-minor-mode-hooks)
    (setq indent-tabs-mode t)
))

(provide 'js-settings)
