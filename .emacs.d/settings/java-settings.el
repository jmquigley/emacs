(add-hook 'java-mode-hook #'(lambda()
   (clang-format-on-save-mode)
))

(provide 'java-settings)
