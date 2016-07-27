;; Customized Variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/bookmarks")
 '(column-number-mode t)
 '(compile-command "cmake CMakeLists.txt && make all && make test ")
 '(display-time-mode t)
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "pdf.sh %s"))))
 '(show-paren-mode t)
 '(sr-show-hidden-files t)
 '(sr-use-commander-keys nil)
 '(sr-window-split-style (quote horizontal)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sr-active-path-face ((t (:background "#ace6ac" :foreground "yellow" :weight bold :height 90)))))
