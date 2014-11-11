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
               autopair
               bookmark+
               centered-cursor-mode
               color-theme-solarized
               dictionary
               expand-region
               flycheck
               git-blame
               google-c-style
               groovy-emacs-mode
               haml-mode
               hl-line+
               jedi
               js2-mode
               line-num
               lorem-ipsum
               magit
               markdown-mode
               matlab-mode
               php-mode
               pydoc-info
               pymacs
               python-mode
               redo+			   
               rst-mode
               ruby-mode
               smart-operator
               smooth-scrolling
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
