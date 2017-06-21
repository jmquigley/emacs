(require 'json-mode)
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode))
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
    (setq web-mode-markup-indent-offset 4)
    (setq web-mode-css-indent-offset 4)
    (setq web-mode-code-indent-offset 4)
    (setq web-mode-enable-auto-quoting nil)
))

(add-hook 'json-mode-hook '(lambda()
    (development-minor-mode-hooks)
	(setq indent-tabs-mode t)
    (setq tab-width 2)
))

(provide 'html-settings)
