(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.pl$" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.pm$" . perl-mode))

(add-hook 'cperl-mode-hook #'(lambda()
    (development-minor-mode-hooks)
    (setq cperl-indent-level 4)
    (cperl-toggle-abbrev)
))

(provide 'cperl-settings)
