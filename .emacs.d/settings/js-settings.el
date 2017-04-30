(require 'js2-mode)
(require 'json-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ts$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))


(add-hook 'js2-mode-hook '(lambda()
    (setq-default js2-basic-offset 4)
    (development-minor-mode-hooks)
    (setq-default indent-tabs-mode t)
))

(add-hook
 'json-mode-hook '(lambda()
    (development-minor-mode-hooks)
	(setq-default indent-tabs-mode t)
    (setq tab-width 2)
))

(provide 'js-settings)
