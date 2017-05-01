(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories (concat emacs.dir "3rd-party/auto-complete"))
(ac-config-default)

(dolist (m '(c-mode 
             c++-mode 
             java-mode
             js2-mode
             rjsx-mode
             python-mode))
(add-to-list 'ac-modes m))

(global-auto-complete-mode t)

(provide 'autocomplete-settings)
