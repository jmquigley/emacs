(add-hook 'find-file-hook 'update-buffer-list)
(add-hook 'after-save-hook 'update-buffer-list)

(provide 'buffer-settings)
