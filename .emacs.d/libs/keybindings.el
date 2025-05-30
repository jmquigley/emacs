;; Contains all of my custom key bindings in one place
;;
;; To test key mappings use:
;;
;;    cat -v
;;
;; This will allow one to type keys at the prompt and see what
;; is emitted.  This is important when debugging different
;; terminals and key mappings (see below)
;;

(require 'elib)
(require 'windows)
(require 'development)
(require 'search)
(require 'undo-tree)

(global-unset-key "\C-z")
(global-set-key (kbd "C-z") 'keyboard-quit)

(global-set-key (kbd "<f1>") 'execute-extended-command)
(global-set-key (kbd "<f2>") #'(lambda() (interactive) (other-window -1)))
(global-set-key (kbd "<f3>") 'other-window)
(global-set-key (kbd "<f4>") #'(lambda() (interactive) (term (getenv "SHELL"))))
(global-set-key (kbd "<f5>") 'recompile)
(global-set-key (kbd "<f6>") 'devdocs-search)
(global-set-key (kbd "<f7>") 'replace-regexp)
(global-set-key (kbd "<f8>") 'dictionary-lookup-definition)
(global-set-key (kbd "<f9>") 'eval-buffer)
(global-set-key (kbd "<f10>") 'eval-last-sexp)
(global-set-key (kbd "<f11>") 'eval-region)
(global-set-key (kbd "<f12>") 'repeat)

(global-set-key (kbd "C-<f3>") 'switch-to-minibuffer-window)
(global-set-key (kbd "C-<f5>") 'compile)
(global-set-key (kbd "C-<f6>") 'open-ssh-buffer)
(global-set-key (kbd "C-<f7>") 'rgrep)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-c n") 'new-buffer-frame)
(global-set-key (kbd "C-c d") 'duplicate-line)
(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "C-c /") 'comment-region)
(global-set-key (kbd "C-x C-k") 'kill-compilation)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "<select>") 'move-end-of-line)
(global-set-key (kbd "C-x w") 'fix-horizontal-size)
(global-set-key (kbd "C-c s") 'isearch-forward-at-point)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "M-?") 'recenter-top-bottom)
(global-set-key (kbd "C-^") 'completion-accept)
(global-set-key (kbd "C-]") #'(lambda() (interactive) (find-file (concat user-emacs-directory "init.el"))))
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-c e") 'expand-abbrev)
(global-set-key (kbd "M-8") 'er/expand-region)
(global-set-key (kbd "M-\\") 'er/expand-region)
(global-set-key (kbd "<Scroll_Lock>") 'scroll-lock-mode)
(global-set-key (kbd "M--") 'undo-tree-undo)
(global-set-key (kbd "M-=") 'undo-tree-redo)
(global-set-key (kbd "M-s") 'replace-string)
(global-set-key (kbd "C-x C-c") 'safe-kill-emacs)
(global-set-key (kbd "C-c <up>") 'move-text-up)
(global-set-key (kbd "ESC <up>") 'move-text-up)
(global-set-key (kbd "C-c <down>") 'move-text-down)
(global-set-key (kbd "ESC <down>") 'move-text-down)
(global-set-key (kbd "M-`") 'capitalize-letter)
(global-set-key (kbd "C-c <deletechar>") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c DEL") 'delete-trailing-whitespace)
(global-set-key (kbd "C-l") 'select-current-line)
(global-set-key (kbd "C-x C-x") 'exchange-point-an-mark-no-transient)
(global-set-key (kbd "\C-c O") 'vi-open-line-above)
(global-set-key (kbd "\C-c o") 'vi-open-line-below)
(global-set-key (kbd "\C-c RET") 'vi-open-line-below)
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-c x") 'toggle-term-mode)
(global-set-key (kbd "C-c C-x") 'toggle-term-mode)
(global-set-key (kbd "C-c r") 'build-references)
(global-set-key (kbd "C-<f1>") 'show-file-name)
(global-set-key (kbd "C-c b") 'show-file-name)
(global-set-key (kbd "C-c m") 'markdown-preview-file)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "S-<return>") 'end-line-semicolon)
(global-set-key (kbd "C-<return>") 'move-end-of-line)
(global-set-key (kbd "C-c t") 'org-insert-todo-heading)
(global-set-key (kbd "C-c f") 'clang-format-buffer)

(global-set-key (kbd "C-c c") 'yas-expand)
(global-set-key (kbd "C-c C-c") 'yas-expand)

(global-unset-key "\M-.")
(global-set-key (kbd "M-.") 'xref-find-definitions)
(global-unset-key "\M-,")
(global-set-key (kbd "M-,") 'xref-pop-marker-stack)

;; Window configurations
(global-set-key (kbd "M-1") 'setup-development-windows)
(global-set-key (kbd "M-2") 'setup-editing-windows)
(global-set-key (kbd "M-3") 'setup-triple-windows)
(global-set-key (kbd "M-4") 'setup-simple-windows)

(global-set-key (kbd "M-<delete>") 'whack-whitespace)
(global-set-key (kbd "ESC <deletechar>") 'delete-horizontal-space)

(global-set-key (kbd "S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-<up>") 'shrink-window)
(global-set-key (kbd "S-<down>") 'enlarge-window)

(global-set-key (kbd "M-<down>") 'forward-paragraph)
(global-set-key (kbd "M-<up>") 'backward-paragraph)
(global-set-key (kbd "M-<right>") 'forward-word)
(global-set-key (kbd "M-<left>") 'backward-word)
;; (global-set-key (kbd "C-<down>") 'scroll-up-command)
;; (global-set-key (kbd "C-<up>") 'scroll-down-command)

(global-set-key (kbd "C-<right>") 'next-buffer)
(global-set-key (kbd "C-<left>") 'previous-buffer)

(if (and (string= system-type 'darwin) (not window-system))
    (progn
        (global-set-key (kbd "M-DEL") 'whack-whitespace)

        (define-key input-decode-map "\M-[1;2D" [(meta resize-left)])
        (global-set-key [(meta resize-left)] 'shrink-window-horizontally)
        (define-key input-decode-map "\M-[1;2C" [(meta resize-right)])
        (global-set-key [(meta resize-right)] 'enlarge-window-horizontally)
        (define-key input-decode-map "\M-[1;2A" [(meta resize-up)])
        (global-set-key [(meta resize-up)] 'shrink-window)
        (define-key input-decode-map "\M-[1;2B" [(meta resize-down)])
        (global-set-key [(meta resize-down)] 'enlarge-window)

        (define-key input-decode-map "\M-[1;9A" [(meta backward-paragraph)])
        (global-set-key [(meta backward-paragraph)] 'backward-paragraph)
        (define-key input-decode-map "\M-[1;9B" [(meta forward-paragraph)])
        (global-set-key [(meta forward-paragraph)] 'forward-paragraph)
        (define-key input-decode-map "\M-[1;9C" [(meta forward-word)])
        (global-set-key [(meta forward-word)] 'forward-word)
        (define-key input-decode-map "\M-[1;9D" [(meta backward-word)])
        (global-set-key [(meta backward-word)] 'backward-word)

        ;; change buffers
        (define-key input-decode-map "\M-[A" [(meta previous-buffer)])
        (global-set-key [(meta previous-buffer)] 'previous-buffer)
        (define-key input-decode-map "\M-[B" [(meta next-buffer)])
        (global-set-key [(meta next-buffer)] 'next-buffer)

        ;;(define-key input-decode-map "\M-[C" [(meta scroll-down)])
        ;;(global-set-key [(meta scroll-down)] 'scroll-down-command)
        ;;(define-key input-decode-map "\M-[D" [(meta scroll-up)])
        ;;(global-set-key [(meta scroll-up)] 'scroll-up-command)

        ;; alt-F5
        (define-key input-decode-map "\M-[15~" [(meta compile-code)])
        (global-set-key [(meta compile-code)] 'compile)

        ;; alt-F6
        (define-key input-decode-map "\M-[17~" [(meta open-ssh-buffer)])
        (global-set-key [(meta open-ssh-buffer)] 'open-ssh-buffer)

        ;; alt-f7
        (define-key input-decode-map "\M-[18~" [(meta rgrep)])
        (global-set-key [(meta rgrep)] 'rgrep)
    )
)

(if window-system
    (progn
        (global-set-key (kbd "C-0") 'toggle-editing-modes)
        (global-set-key (kbd "C-8") 'my-isearch-word-at-point)
    )
    (progn
        (define-key input-decode-map "\M-[1;5p" [(meta mode-toggle)]) ; C-0
        (global-set-key [(meta mode-toggle)] 'toggle-editing-modes)
        (define-key input-decode-map "\M-[1;5x" [(meta search)]) ; C-8
        (global-set-key [(meta search)] 'my-isearch-word-at-point)
    )
)

(add-hook 'markdown-mode-hook
    #'(lambda ()
       (local-unset-key (kbd "M-["))
       (local-unset-key (kbd "M-]"))
       (local-unset-key (kbd "M-<right>"))
       (local-unset-key (kbd "M-<left>"))
       (local-unset-key (kbd "M-<up>"))
       (local-unset-key (kbd "M-<down>"))
))

(provide 'keybindings)
