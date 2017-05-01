(require 'yasnippet)

(setq yas-indent-line 'fixed)
(setq yas-prompt-functions '(yas/dropdown-prompt
                            yas/ido-prompt
                            yas/completing-prompt))
(yas-global-mode t)

(defun yas-org-very-safe-expand ()
    (let ((yas-fallback-behavior 'return-nil)) (yas-expand)))

(provide 'yasnippet-settings)
