;; This is the custom color theme for the mycoredump project.  This relies on the
;; color-theme emacs package located here:
;; http://www.emacswiki.org/emacs-en/ColorTheme
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
(require 'bookmark+)
(require 'org)
(require 'whitespace)

(defun common-font-locks()
"Common color settings for all modes"

    ;; default background/foreground
    (set-face-foreground 'default "white")
    (set-face-background 'default "black")
 
    ;; Cursor
    (set-face-background 'cursor "cyan")

    ;; Highlight line
    (set-face-background 'hl-line "#00005f")
    (set-face-foreground 'lazy-highlight (face-attribute 'default :background))

    ;; Region mark color
    (set-face-background 'region "#626262")
    (set-face-foreground 'region "#00005f")

    ;; UI
    (set-face-background 'mode-line "#870000")
    (set-face-foreground 'mode-line "#ffffff")
    (set-face-foreground 'minibuffer-prompt "yellow")
    (set-face-foreground 'yas-field-highlight-face "cyan")

    ;; Parentheses Highlighter
    (set-face-background 'show-paren-match-face (face-attribute 'default :background))
    (set-face-foreground 'show-paren-match-face "#d70000")
    (set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)

    ;; Window numbering
    (set-face-background 'window-number-face nil)

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
    ;;(set-face-foreground 'bmkp-light-fringe-autonamed (face-attribute 'default :background))
    (set-face-background 'bmkp-bad-bookmark "red")
    (set-face-foreground 'bmkp-bad-bookmark (face-attribute 'default :foreground))
    (set-face-foreground 'bmkp-heading (face-attribute 'default :foreground))
    (set-face-background 'bmkp-heading (face-attribute 'default :background))
    (set-face-background 'bmkp-light-mark "#626262")
    (set-face-foreground 'bmkp-light-mark "#00005f")
    (set-face-foreground 'bmkp-no-local "#870000")

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
)

(common-font-locks)

(defun general-programming-font-locks()
"Common color settings for all programming modes"

    ;; Programming faces
    (set-face-foreground 'font-lock-builtin-face "#b8860b")
    (set-face-foreground 'font-lock-comment-face "#585858")
        (set-face-italic-p 'font-lock-comment-face t)
    (set-face-foreground 'font-lock-comment-delimiter-face "#444444")
        (set-face-italic-p 'font-lock-comment-delimiter-face t)
    (set-face-foreground 'font-lock-preprocessor-face "#e3ea94")
    (set-face-foreground 'font-lock-function-name-face "#197b6e")
    (set-face-foreground 'font-lock-constant-face "#e3ea94")
    (set-face-foreground 'font-lock-preprocessor-face "#197b6e")
    (set-face-foreground 'font-lock-keyword-face "#ffaf00")
    (set-face-foreground 'font-lock-type-face "#00d700")
    (set-face-foreground 'font-lock-variable-name-face "#0087ff")
    (set-face-background 'font-lock-warning-face "#870000")
        (set-face-foreground 'font-lock-warning-face (face-attribute 'default :foreground))
        (set-face-bold-p 'font-lock-warning-face t)
    (set-face-foreground 'font-lock-string-face "#ffff87")

    ;; Line numbers in the left column
    (set-face-background 'linum "#262626")
    (set-face-foreground 'linum "#5f8700")
    (set-face-font 'linum (face-attribute 'default :font))
    (set-face-attribute 'linum nil :height 80)
)
(add-hook 'c-mode-common-hook 'general-programming-font-locks)
(add-hook 'cperl-mode-hook 'general-programming-font-locks)
(add-hook 'emacs-lisp-mode-hook 'general-programming-font-locks)
(add-hook 'java-mode-hook 'general-programming-font-locks)
(add-hook 'ruby-mode-hook 'general-programming-font-locks)
(add-hook 'groovy-mode-hook 'general-programming-font-locks)

(defun python-font-locks()
"Color settings for the python programming mode"
    (general-programming-font-locks)
    ;;(set-face-foreground 'py-builtins-face "brightred")
    ;;(set-face-foreground 'py-variable-name-face "#0087ff")
    ;;(set-face-foreground 'py-number-face "#af0000")
    ;;(set-face-foreground 'py-class-name-face "brightgreen")
)
(add-hook 'python-mode-hook 'python-font-locks)

(defun restructuredtext-font-locks()
"Color settings for the resturctured text mode"
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
)
(add-hook 'rst-mode-hook 'restructuredtext-font-locks)

(defun markdown-mode-font-locks()
"Color settings for the markdown text mode"
;;    (set-face-foreground 'markdown-header-face-1 "#ffff00")
;;    (set-face-foreground 'markdown-header-face-2 "#ffd700")
;;    (set-face-foreground 'markdown-header-face-3 "#ffaf00")
;;    (set-face-foreground 'markdown-header-face-4 "#ff8700")
;;    (set-face-foreground 'markdown-header-face-5 "#ff5f00")
;;    (set-face-foreground 'markdown-header-face-6 "#ff0000")
;;    (set-face-foreground 'markdown-italic-face "#af00ff")
;;    (set-face-foreground 'markdown-bold-face "#005fd7")
;;    (set-face-foreground 'markdown-inline-code-face "#767676")
;;    (set-face-foreground 'markdown-pre-face "#5fd7ff")
;;    (set-face-foreground 'markdown-list-face "#af8700")
;;    (set-face-foreground 'markdown-metadata-key-face "#2e8b57")
;;    (set-face-foreground 'markdown-metadata-value-face "#87ffaf")
;;    (set-face-foreground 'markdown-header-face "#585858")
;;    (set-face-foreground 'markdown-header-delimiter-face "#ffaf00")
;;    (set-face-foreground 'markdown-header-rule-face "#ffaf00")
;;
;;    (set-face-foreground 'markdown-link-face "#4169e1")
;;    (set-face-foreground 'markdown-url-face "#9acd32")
;;    (set-face-foreground 'markdown-link-title-face "#878700")
;;
;;    (set-face-foreground 'markdown-reference-face "goldenrod")
;;    (set-face-foreground 'markdown-footnote-face "goldenrod")
;;
;;    (set-face-foreground 'markdown-math-face "magenta")
;;
;;    (set-face-foreground 'markdown-language-keyword-face
;;        (face-attribute 'font-lock-keyword-face :foreground))
;;
;;    (set-face-foreground 'markdown-comment-face 
;;        (face-attribute 'font-lock-comment-face :foreground))
)
(add-hook 'markdown-mode-hook 'markdown-mode-font-locks)

(defun orgmode-font-locks()
"Color settings for org mode"
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
)
(add-hook 'org-mode-hook 'orgmode-font-locks)

;; Adds a font color scheme in python and C mode that will highlight the
;; keywords FIXME, TODO and BUG
(defun add-keywords()
"Adds syntax highlighting for keywords in a particular mode."
    (font-lock-add-keywords nil
        '(("\\<\\(FIXME\\|TODO\\|BUG\\|IMPORTANT\\):" 1 font-lock-warning-face t))))

(provide 'theme)
