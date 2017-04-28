;; cornell.el -- cornell notes table expansion
;;
;; A specialied library that is used to convert betwen a cornell table in
;; restructured text mode and an org mode table.
;;
;; James Quigley
;; Created: 01/05/2013
;;
(require 'elib)
(require 'org)
(require 'asciidoc-mode)
(with-no-warnings (require 'cl))

(defun cornell-remove-spaceholders ()
"Searches the document to remove the space holder values in the table
structures.  The space holder value is based on the orgmode character
'_' which represents a space value in org tables.

This is a PERMANENT change when executed.  It cannot be undone."
    (interactive)
    (save-excursion
        (goto-char (point-min))
        (while (re-search-forward " | _ " nil t)
            (replace-match " |   " nil nil))))

(defconst cornell-question-width "36")
(defconst cornell-answer-width "85")

(defun cornell-divider()
"Inserts a guideline divider for writing notes"
    (interactive)
    (let ((divider "|"))
        (loop repeat (+ (string-to-number cornell-question-width)
                        (string-to-number cornell-answer-width) 6)
            do (setq divider (concat divider "=")))
        divider))

(defconst cornell-asciidoc-header (cornell-divider))
(defconst cornell-asciidoc-header-re "|==+")
(defconst cornell-org-header (concat "| <" cornell-question-width "> | "
                                       "<" cornell-answer-width "> |"))
(defconst cornell-org-header-re "| *<[0-9][0-9]>.+<[0-9][0-9]>.*")

(defun cornell-convert-asciidoc-to-org ()
    (interactive)
    (save-excursion
        (local-replace-string cornell-asciidoc-header-re cornell-org-header)
        (goto-char (point-min))
        (while (re-search-forward cornell-org-header nil t)
            (org-ctrl-c-ctrl-c))))

(defun cornell-convert-org-to-asciidoc ()
    (interactive)
    (save-excursion
        (local-replace-string " +|$" "")
        (local-replace-string cornell-org-header-re cornell-asciidoc-header)))

(defun cornell-convert-org-to-rst ()
"Searches the current document for org mode table dividers and converts
them to rst mode dividers"
    (interactive)
    (local-replace-string "|--" "+--")
    (local-replace-string "--|$" "--+")
)

(defun cornell-convert-rst-to-org ()
"Searches the current buffer for rst mode table dividers and converts them
to org mode dividers"
    (interactive)

    (local-replace-string "\\+--" "|--")
    (local-replace-string "--\\+$" "--|")
)

(defun org-mode-local-keybindings ()
"My custom key bindings for org mode"
    (local-set-key (kbd "M-<prior>") 'org-table-kill-row)
    (local-set-key (kbd "M-<next>") 'org-table-insert-row)
    (local-set-key (kbd "M-m r") 'cornell-convert-org-to-rst)
    (local-set-key (kbd "M-m o") 'cornell-convert-rst-to-org)
)
(add-hook 'org-mode-hook 'org-mode-local-keybindings)
(add-hook 'orgtbl-mode-hook 'org-mode-local-keybindings)

(provide 'cornell)
