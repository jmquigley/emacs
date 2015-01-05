(require 'org)

(setq org-log-done 'time
      org-adapt-indentation t
	  org-todo-keywords
          '((sequence "TODO" "DUE" "VERIFY" "|" "DONE" "CANCELED" "DELEGATED")))

(add-hook 'org-mode-hook
    (lambda ()
        (local-set-key (kbd "M-<right>") 'next-buffer)
        (local-set-key (kbd "M-<left>") 'previous-buffer)
        (visual-line-mode -1)
        (make-variable-buffer-local 'yas/trigger-key) 
        (setq yas/trigger-key [tab]) 
        (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand) 
        (define-key yas/keymap [tab] 'yas/next-field)))

;; This creates a hook that will open evernote links through the browser.  It makes following these
;; types of links in orgmode possible
(defun org-pass-link-to-system (link)
  (if (string-match "^[a-zA-Z0-9]+:" link)
      (browse-url link)
    nil)
  )

(add-hook 'org-open-link-functions 'org-pass-link-to-system)

(provide 'org-mode-settings)
