;;
;; The available color values can be seen in emacs with:
;; M-x list-colors-display
;;
(require 'hl-line)
(require 'linum)
(require 'yasnippet)
(require 'paren)
(require 'rst)
(require 'markdown-mode)
(require 'mmd-mode)
(require 'bookmark+)
(require 'org)
(require 'whitespace)
(require 'rainbow-delimiters)
(require 'ido)
(require 'web-mode)
(require 'window-number)

;; Don't use italics in a console.  It will cause font tearing and a weird garbled buffer.
(set-face-italic-p 'italic nil)

(defconst background "#000000")
(defconst current-line "#2a2a2a")
(defconst selection "#424242")
(defconst foreground "#eaeaea")
(defconst comment "#969896")
(defconst red "#d54e53")
(defconst orange "#e78c45")
(defconst yellow "#e7c547")
(defconst green "#b9ca4a")
(defconst aqua "#70c0b1")
(defconst blue "#7aa6da")
(defconst purple "#c397d8")

;; default background/foreground
(set-face-attribute 'default nil :foreground foreground :background background)

;; Bookmarks plus
(set-face-background 'bmkp-local-file-without-region (face-attribute 'default :background))
(set-face-foreground 'bmkp-local-file-without-region "#8700ff")
(set-face-foreground 'bmkp-local-file-with-region "#00afff")
(set-face-background 'bmkp-local-directory (face-attribute 'default :background))
(set-face-foreground 'bmkp-local-directory "#00d700")
(set-face-foreground 'bmkp-gnus "#005fff")
(set-face-foreground 'bmkp-file-handler (face-attribute 'default :background))
(set-face-foreground 'bmkp-info "magenta")
(set-face-foreground 'bmkp-light-autonamed (face-attribute 'default :background))
(set-face-background 'bmkp-bad-bookmark "red")
(set-face-foreground 'bmkp-bad-bookmark (face-attribute 'default :foreground))
(set-face-foreground 'bmkp-heading (face-attribute 'default :foreground))
(set-face-background 'bmkp-heading (face-attribute 'default :background))
(set-face-background 'bmkp-light-mark "#626262")
(set-face-foreground 'bmkp-light-mark "#00005f")
(set-face-foreground 'bmkp-no-local "#870000")

;; Cursor
(set-face-background 'cursor "white")

;; Highlight line
(set-face-background 'hl-line "#00005f")

;; Ido
(set-face-attribute 'ido-subdir nil :foreground comment)
(set-face-attribute 'ido-first-match nil :foreground orange)
(set-face-attribute 'ido-only-match nil :foreground red)
(set-face-attribute 'ido-indicator nil :foreground red :background background)
(set-face-attribute 'ido-virtual nil :foreground comment)

;; Linum mode
(set-face-background 'linum "#262626")
(set-face-foreground 'linum "#5f8700")
(set-face-font 'linum (face-attribute 'default :font))
(set-face-attribute 'linum nil :height 80)

;; Markdown mode
(set-face-foreground 'markdown-header-face-1 "#ffff00")
(set-face-foreground 'markdown-header-face-2 "#ffd700")
(set-face-foreground 'markdown-header-face-3 "#ffaf00")
(set-face-foreground 'markdown-header-face-4 "#ff8700")
(set-face-foreground 'markdown-header-face-5 "#ff5f00")
(set-face-foreground 'markdown-header-face-6 "#ff0000")
(set-face-foreground 'markdown-italic-face "#af00ff")
(set-face-foreground 'markdown-bold-face "#005fd7")
(set-face-foreground 'markdown-list-face "#af8700")
(set-face-foreground 'markdown-metadata-key-face "#2e8b57")
(set-face-foreground 'markdown-metadata-value-face "#87ffaf")
(set-face-foreground 'markdown-header-face "#585858")
(set-face-foreground 'markdown-header-delimiter-face "#ffaf00")
(set-face-foreground 'markdown-header-rule-face "#ffaf00")
(set-face-foreground 'markdown-link-face "#4169e1")
(set-face-foreground 'markdown-url-face "#9acd32")
(set-face-foreground 'markdown-link-title-face "#878700")
(set-face-foreground 'markdown-reference-face "goldenrod")
(set-face-foreground 'markdown-math-face "magenta")
(set-face-background 'markdown-markup-face background)
(set-face-background 'markdown-language-keyword-face background)
(set-face-background 'markdown-code-face background)

(set-face-foreground 'markdown-language-keyword-face
    (face-attribute 'font-lock-keyword-face :foreground))
(set-face-foreground 'markdown-comment-face
    (face-attribute 'font-lock-comment-face :foreground))

(set-face-attribute 'markdown-inline-code-face nil :foreground "#5fd7ff" :background "#585858")
(set-face-attribute 'markdown-pre-face nil :foreground "#5fd7ff" :background "#585858")

;; Org mode
(set-face-foreground 'org-table "#00d7ff")
(set-face-foreground 'org-checkbox "#00ff5f")
(set-face-foreground 'org-todo "#ffd700")
(set-face-foreground 'org-date "#ee0000")
(set-face-foreground 'org-checkbox-statistics-todo "#daa520")
(set-face-foreground 'org-checkbox-statistics-done "#daa520")
(set-face-foreground 'org-level-1 "#005fff")
(set-face-foreground 'org-level-2 "#0087ff")
(set-face-foreground 'org-level-3 "#00d7ff")
(set-face-foreground 'org-level-4 "#00af00")
(set-face-foreground 'org-level-5 "#00ff5f")

;; Parentheses Highlighter
(set-face-attribute 'show-paren-match nil :foreground nil :background "yellow" :weight 'extra-bold)

;; Programming
(set-face-foreground 'font-lock-builtin-face aqua)
(set-face-foreground 'font-lock-comment-face comment)
(set-face-foreground 'font-lock-comment-delimiter-face comment)
(set-face-foreground 'font-lock-constant-face aqua)
(set-face-foreground 'font-lock-doc-face comment)
(set-face-foreground 'font-lock-function-name-face blue)
(set-face-foreground 'font-lock-keyword-face purple)
(set-face-foreground 'font-lock-negation-char-face green)
(set-face-foreground 'font-lock-preprocessor-face purple)
(set-face-foreground 'font-lock-regexp-grouping-backslash yellow)
(set-face-foreground 'font-lock-regexp-grouping-construct purple)
(set-face-foreground 'font-lock-string-face green)
(set-face-foreground 'font-lock-type-face yellow)
(set-face-foreground 'font-lock-variable-name-face orange)
(set-face-background 'font-lock-warning-face "#870000")
(set-face-foreground 'font-lock-warning-face (face-attribute 'default :foreground))
(set-face-bold-p 'font-lock-warning-face t)

;; Rainbow delimiters
(set-face-foreground 'rainbow-delimiters-depth-1-face purple)
(set-face-foreground 'rainbow-delimiters-depth-2-face blue)
(set-face-foreground 'rainbow-delimiters-depth-3-face aqua)
(set-face-foreground 'rainbow-delimiters-depth-4-face green)
(set-face-foreground 'rainbow-delimiters-depth-5-face yellow)
(set-face-foreground 'rainbow-delimiters-depth-6-face orange)
(set-face-foreground 'rainbow-delimiters-depth-7-face red)
(set-face-foreground 'rainbow-delimiters-depth-8-face comment)
(set-face-foreground 'rainbow-delimiters-depth-9-face foreground)
(set-face-foreground 'rainbow-delimiters-unmatched-face "firebrick")

;; Region mark color
(set-face-background 'region "#626262")
(set-face-foreground 'region "#00005f")

;; Restructuredtext mode
(set-face-foreground 'rst-level-1 "#ffff00")
    (set-face-background 'rst-level-1 (face-attribute 'default :background))
(set-face-foreground 'rst-level-2 "#ffd700")
    (set-face-background 'rst-level-2 (face-attribute 'default :background))
(set-face-foreground 'rst-level-3 "#ffaf00")
    (set-face-background 'rst-level-3 (face-attribute 'default :background))
(set-face-foreground 'rst-level-4 "#ff8700")
    (set-face-background 'rst-level-4 (face-attribute 'default :background))
(set-face-foreground 'rst-level-5 "#ff5f00")
    (set-face-background 'rst-level-5 (face-attribute 'default :background))
(set-face-foreground 'rst-level-6 "#ff0000")
    (set-face-background 'rst-level-6 (face-attribute 'default :background))

(set-face-foreground 'rst-comment (face-attribute 'font-lock-comment-face :foreground))
(set-face-foreground 'rst-adornment "#ff8700")  ;; divider line for headings
(set-face-foreground 'rst-block "#af8700")      ;; bullet points
(set-face-foreground 'rst-emphasis1 "#af00ff")  ;; italic text
    (set-face-attribute 'rst-emphasis1 nil :underline nil)
(set-face-foreground 'rst-emphasis2 "#005fd7")  ;; bold text
(set-face-foreground 'rst-literal "#767676")    ;; fixed/literal text
(set-face-foreground 'rst-external "#4169e1")   ;; link
(set-face-foreground 'rst-definition "#197b6e") ;; reference
(set-face-foreground 'rst-reference "#197b6e")
(set-face-foreground 'rst-directive "#870000")  ;; Sphinx directive

(set-face-foreground 'rst-transition "yellow")  ;; ???

;; Search
(set-face-attribute 'lazy-highlight nil :foreground "black" :background "yellow")

;; UI
(set-face-background 'mode-line "#870000")
(set-face-foreground 'mode-line "#ffffff")
(set-face-foreground 'minibuffer-prompt "yellow")
(set-face-foreground 'yas-field-highlight-face "cyan")
(set-face-foreground 'mode-line-buffer-id "yellow")

;; Window numbering
(set-face-background 'window-number-face nil)

;; Whitespace mode
(set-face-attribute 'whitespace-space nil :foreground "firebrick" :background nil)
(set-face-attribute 'whitespace-hspace nil :foreground "lightgray" :background "blue")
(set-face-attribute 'whitespace-empty nil :foreground "SlateGray1" :background "firebrick")
(set-face-attribute 'whitespace-line nil :foreground "black" :background "red")
(set-face-attribute 'whitespace-newline nil :foreground "firebrick" :background nil)
(set-face-attribute 'whitespace-tab nil :foreground "firebrick" :background nil)
(set-face-attribute 'whitespace-indentation nil :foreground "firebrick" :background nil)
(set-face-attribute 'whitespace-trailing nil :foreground "firebrick" :background nil)
(set-face-attribute 'whitespace-space-after-tab nil :foreground "black" :background "green")
(set-face-attribute 'whitespace-space-before-tab nil :foreground "black" :background "DarkOrange")

;; Adds a font color scheme in python and C mode that will highlight the
;; keywords FIXME, TODO and BUG
(defun add-keywords()
"Adds syntax highlighting for keywords in a particular mode."
    (font-lock-add-keywords nil
        '(("\\<\\(FIXME\\|TODO\\|BUG\\|IMPORTANT\\):" 1 font-lock-warning-face t))))

(provide 'theme)
