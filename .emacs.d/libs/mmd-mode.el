;; mmd-mode.el -- A customized markdown mode that uses multimarkdown syntax.
;; highlighting.
;;
;; This is a major mode that is derived from the emacs markdown-mode created
;; by Jason Blevins.  Markdown mode can be found @ 
;; http://jblevins.org/projects/markdown-mode/
;;
;; In order to use this derived mode you must first retrieve the original
;; markdown mode from the site above.
;;
;; To use this mode, first add it to your load path in .emacs:
;; 
;;     (add-to-list 'load-path "{code location}")
;;
;; Once this is in your load path add a require statement to source it
;;
;;     (require 'mmd-mode)
;;
;; To automatically start the mode when visiting an mmd file add the
;; following to your .emacs file:
;;
;;     (add-to-list 'auto-mode-alist '("\\.md\\'" . mmd-mode))
;;     (add-to-list 'auto-mode-alist '("\\.mdwn\\'" . mmd-mode))
;;     (add-to-list 'auto-mode-alist '("\\.mdt\\'" . mmd-mode))
;;     (add-to-list 'auto-mode-alist '("\\.mmd\\'" . mmd-mode))
;;
(require 'markdown-mode)

(defconst mmd-mode-version "0.1")
(defconst mmd-options "")

(defun mmd-return ()
"Intercepts the return key to perform a processing check of your current location."
    (interactive)
    (let ((current-line (thing-at-point 'line)) str)
        (insert "\n")))

(defvar mmd-mode-map
       (let ((map (make-sparse-keymap))
             (menu-map (make-sparse-keymap "mmd")))
             (define-key map (kbd "RET") 'mmd-return)
          map)
       "Keymap for editing mmd files.")

;;;###autoload
(define-derived-mode mmd-mode markdown-mode "Multimarkdown"
"Major mode for modifying Multimarkup files.
\\{mmd-mode-map}"

    (kill-local-variable 'paragraph-start)
    (kill-local-variable 'paragraph-separate)

    (setq combined-font-locks (append mmd-font-lock-keywords markdown-mode-font-lock-keywords))
    (setq font-lock-defaults '(combined-font-locks))

    (set-face-foreground 'markdown-header-face-1 "#ffff00")
    (set-face-foreground 'markdown-header-face-2 "#ffd700")
    (set-face-foreground 'markdown-header-face-3 "#ffaf00")
    (set-face-foreground 'markdown-header-face-4 "#ff8700")
    (set-face-foreground 'markdown-header-face-5 "#ff5f00")
    (set-face-foreground 'markdown-header-face-6 "#ff0000")

    (set-face-foreground 'markdown-italic-face "#af00ff")
    (set-face-foreground 'markdown-bold-face "#005fd7")
    (set-face-foreground 'markdown-pre-face "#5fd7ff")
    (set-face-foreground 'markdown-list-face "#af8700")
    (set-face-foreground 'markdown-metadata-key-face "#2e8b57")
    (set-face-foreground 'markdown-metadata-value-face "#87ffaf")
    (set-face-foreground 'markdown-header-face "#585858")
    (set-face-foreground 'markdown-header-delimiter-face "#ffaf00")
    (set-face-foreground 'markdown-header-rule-face "#ffaf00")
    (set-face-attribute 'markdown-inline-code-face nil :foreground "#5fd7ff" :background "#585858")
    (set-face-attribute 'markdown-pre-face nil :foreground "#5fd7ff" :background "#585858")

    (set-face-foreground 'markdown-link-face "#4169e1")
    (set-face-foreground 'markdown-url-face "#9acd32")
    (set-face-foreground 'markdown-link-title-face "#878700")

    (set-face-foreground 'markdown-reference-face "goldenrod")

    (set-face-foreground 'markdown-math-face "#d787d7")
    
    (set-face-foreground 'markdown-language-keyword-face
        (face-attribute 'font-lock-keyword-face :foreground))

    (set-face-foreground 'markdown-comment-face 
        (face-attribute 'font-lock-comment-face :foreground))
)

(defgroup mmd-faces nil
  "Multimarkup mode highlighting group"
  :group 'mmd)

(defface mmd-html-face '((t (:foreground "#87afff")))
"Face for select html tags that are embedded into markdown"
:group 'mmd-faces)
(defvar mmd-html 'mmd-html-face)
(defconst mmd-html-re "<img .*/>")

(defface mmd-list-face '((t (:foreground "#af8700")))
"Face for selecting the start of a list of elements"
:group 'mmd-faces)
(defvar mmd-list 'mmd-list-face)
(defconst mmd-list-re "^[ ]*[*.]+ \\|[ ]+[*.]+ \\|^[ ]*- \\|[ ]+- \\|^[ ]*[a-z0-9]+\\. \\|[ ]+[0-9][0-9]?[0-9]?\\. \\|[ ]+[a-z]\\. ")

(defface mmd-math-face '((t (:foreground "#d787d7")))
"Face for selecting Multimarkdown specific math symbols"
:group 'mmd-faces)
(defvar mmd-math 'mmd-math-face)
(defconst mmd-math-re "\\(\\\\\\{1,2\\}\\)\\[\\(.\\|\n\\)*?\\1]")

(defface mmd-table-face '((t (:foreground "#878700")))
"Face for simple markdown extra tables"
:group 'mmd-faces)
(defvar mmd-table 'mmd-table-face)
(defconst mmd-table-re "\|.*\|")

(defface mmd-admonition-face 
    '((t (:foreground "#af0000" :background "white")))
"Face for admonition notes"
:group 'mmd-faces)
(defvar mmd-admonition 'mmd-admonition-face)
(defconst mmd-admonition-re 
    "NOTE:\\|TIP:\\|IMPORTANT:\\|CAUTION:\\|WARNING:")

(defvar mmd-functions
    '("footnote" "footnoteref" "indexterm" "indexterm2" "latexmath" "asciimath"
      "quanda" "glossary" "bibliography" "mailto"))
(defconst  mmd-functions-re (regexp-opt mmd-functions 'words))

(defvar mmd-operators '(""))
(defconst mmd-operators-re "::\\|(Q)\\|(V)\\|(C)\\|(R)\\|(TM)\\|=>\\|<=\\|&#[0-9]+?;\\|([0-9]+)")

(defvar mmd-font-lock-keywords
    (list
       `(,mmd-html-re . mmd-html)
       `(,mmd-math-re . mmd-math)
       `(,mmd-table-re . mmd-table)
       `(,mmd-list-re . mmd-list)
       `(,mmd-functions-re . font-lock-function-name-face)
       `(,mmd-operators-re . font-lock-builtin-face)
       `(,mmd-admonition-re . mmd-admonition)
    ))

(provide 'mmd-mode)
