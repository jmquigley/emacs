(require 'mmd-mode)
(require 'centered-cursor-mode)

(setq-default markdown-enable-math t
              markdown-enable-itex t
              markdown-hide-urls nil
              markdown-command "mark"
              markdown-open-command "mark")

(add-to-list 'auto-mode-alist '("\\.md\\'" . mmd-mode))
(add-to-list 'auto-mode-alist '("\\.mdwn\\'" . mmd-mode))
(add-to-list 'auto-mode-alist '("\\.mdt\\'" . mmd-mode))
(add-to-list 'auto-mode-alist '("\\.mmd\\'" . mmd-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . mmd-mode))
(add-hook 'mmd-mode-hook '(lambda()
    (minor-mode-hooks)
    (goto-address-mode)
))

(provide 'multimarkdown-settings)
