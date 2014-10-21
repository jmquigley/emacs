;; set the el-get path, and create it if it doesn't exist
(setq elget-path plugin-path)
(unless (file-exists-p elget-path)
  (make-directory elget-path))

;; add el-get to the load path, and install it if it doesn't exist
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; packages to install
;; use 'el-get-list-packages' to see the list of available packages
(setq
 my-packages '(auctex
               auto-complete
               color-theme-solarized
               expand-region
               flycheck
               google-c-style
               groovy-emacs-mode
               haml-mode
               magit
               markdown-mode
               matlab-mode
               pydoc-info
               jedi
               autopair
               bookmark+
               hl-line+
               line-num
               pymacs
               dictionary
               rst-mode
               smart-operator
               tidy
               virtualenvwrapper
               window-number
               yaml-mode
               yasnippet
               ))

; first enable shallow clone, so we don't need to clone the entire
; history of every project
(setq el-get-git-shallow-clone t)

; then intsall!
(el-get 'sync my-packages)

(provide 'el-get-settings)
