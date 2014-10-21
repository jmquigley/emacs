(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories (concat emacs.dir "3rd-party/auto-complete"))
(ac-config-default)

(provide 'autocomplete-settings)