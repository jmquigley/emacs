(require 'json-mode)
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(add-hook 'html-mode-hook '(lambda()
    (development-minor-mode-hooks)
))

(add-hook 'css-mode-hook '(lambda()
    (development-minor-mode-hooks)
))

(add-hook 'web-mode-hook '(lambda ()
    (development-minor-mode-hooks)
    (setq indent-tabs-mode t)
))

(add-hook 'json-mode-hook '(lambda()
    (development-minor-mode-hooks)
	(setq indent-tabs-mode t)
    (setq tab-width 2)
))

(provide 'html-settings)
