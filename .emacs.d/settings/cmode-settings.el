(defun base-c-hook ()
"Common code for all cmode initializations"
    (development-minor-mode-hooks)
    (c-set-offset 'substatement-open 0)

    (setq c++-tab-always-indent t)
    (setq c-basic-offset 4)
    (setq c-indent-level 4)
    (setq c-basic-indent 4)
    (setq indent-tabs-mode nil)

    (clang-format-on-save-mode)
)

(add-hook 'c-mode-common-hook #'(lambda()
    (base-c-hook)
))

(add-hook 'c++-mode-hook #'(lambda()
    (base-c-hook)
))

(add-hook 'objc-mode-hook #'(lambda()
    (base-c-hook)
))

(use-package lsp-mode
:ensure t
:hook (prog-mode . lsp-deferred) ; Enable lsp-mode for programming modes
:custom
(lsp-clients-clangd-executable "clangd") ; Specify clangd executable path if not in PATH
(lsp-auto-guess-root t) ; Auto-guess project root
(lsp-prefer-capf t)) ; Prefer company-capf for completion

(use-package company
:ensure t
:hook (prog-mode . company-mode) ; Enable company-mode for programming modes
:bind (:map company-mode-map
([remap completion-at-point] . company-complete))
:custom
(company-backends '(company-capf))) ; Use company-capf as the backend

(provide 'cmode-settings)
