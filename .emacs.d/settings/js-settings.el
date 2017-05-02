(require 'js2-mode)
(require 'json-mode)
(require 'rjsx-mode)
(require 'tern)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ts$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(add-hook 'js2-mode-hook '(lambda()
    (tern-mode t)
    (setq-default js2-basic-offset 4)
    (development-minor-mode-hooks)
    (setq-default indent-tabs-mode t)
    ))

(add-hook 'rjsx-mode-hook '(lambda()
    (if (bound-and-true-p tern-mode)
        (progn
          (message "Removing Tern from RJSX mode")
          (tern-mode -1)
        ))
))

(add-hook
 'json-mode-hook '(lambda()
    (development-minor-mode-hooks)
	(setq-default indent-tabs-mode t)
    (setq tab-width 2)
    ))

;; (eval-after-load 'tern '(progn
;;     (require 'tern-auto-complete)
;;     (tern-ac-setup)))

(provide 'js-settings)
