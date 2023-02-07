(add-hook 'find-file-hook 'update-buffer-list)
(add-hook 'after-save-hook 'update-buffer-list)
(add-hook 'before-save-hook #'(lambda()
    (delete-trailing-whitespace)
))

(provide 'buffer-settings)
