(require 'bookmark+)

(setq bookmark-file (concat root.dir "bookmarks")
      bookmark-save-flag t
      bookmark-bmenu-file-column 50
	  bmkp-propertize-bookmark-names-flag t)

(add-hook 'bookmark-bmenu-mode-hook #'(lambda()
    (hl-line-mode t)
))

(add-hook 'bmkp-edit-bookmark-record-mode #'(lambda()
))

(provide 'bookmark-settings)
