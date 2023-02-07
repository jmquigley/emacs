(require 'asciidoc-mode)

(add-to-list 'auto-mode-alist '("\\.doc$" . asciidoc-mode))
(add-to-list 'auto-mode-alist '("\\.asciidoc$" . asciidoc-mode))
(add-to-list 'auto-mode-alist '("\\.ascii$" . asciidoc-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . asciidoc-mode))
(add-to-list 'auto-mode-alist '("\\.text$" . asciidoc-mode))
(add-hook 'asciidoc-mode-hook #'(lambda()
    (minor-mode-hooks)
))

(provide 'asciidoc-settings)
