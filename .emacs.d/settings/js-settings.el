(require 'js2-mode)
(require 'json-mode)
(require 'rjsx-mode)
(require 'web-mode)

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
(add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.d\\.ts$" . typescript-mode))

(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(add-hook 'js2-mode-hook '(lambda()
    (setq js2-basic-offset 4)
    (development-minor-mode-hooks)
    (setq indent-tabs-mode t)

    (when (string-equal "js" (file-name-extension buffer-file-name))
        (tern-mode t))
))

(add-hook 'rjsx-mode-hook '(lambda()
    (development-minor-mode-hooks)
    (if (bound-and-true-p tern-mode)
        (progn
          (message "Removing Tern from RJSX mode")
          (tern-mode -1)
        ))
))

(add-hook 'json-mode-hook '(lambda()
    (development-minor-mode-hooks)
	(setq indent-tabs-mode t)
    (setq tab-width 2)
))

(add-hook 'web-mode-hook '(lambda ()
    (development-minor-mode-hooks)
))

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(provide 'js-settings)
