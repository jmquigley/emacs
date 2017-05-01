;; Reusable common library functions.
;;
(with-no-warnings (require 'cl))

;;;###autoload
(defun safe-kill-emacs () 
"save some buffers, then exit unconditionally" 
    (interactive) 
    (save-some-buffers nil t) 
    (kill-emacs)) 

;;;###autoload
(defun trim-string (str) 
"Removes whitespace from the front and end of a string"
    (replace-regexp-in-string "\\`[ \t\n]*" "" 
    (replace-regexp-in-string "[ \t\n]*\\'" "" str)))

;;;###autoload
(defun is-blank (str)
"Checks the input string to see if it is a blank line.  It trims the string
first before checking.  If it is bank, then it returns true, else nil"
    (let ((str (trim-string str)))
        (if (string= str "") t nil)))

;;;###autoload
(defun center-string (string size)
  (let* ((padding (/ (- size (length string)) 2))
         (lpad (+ (length string) padding))
         (lformat (format "%%%ds" lpad))
         (rformat (format "%%%ds" (- size))))
    (format rformat (format lformat string))))

;;;###autoload
(defun hline ()
"Draws an 80 character horizontal line in the current buffer from the
current position"
    (interactive)
    (loop repeat 65 do (insert "-"))
    (insert "\n"))

;;;###autoload
(defun touch ()
"updates modified time on the file for the current buffer"
     (interactive)
     (save-buffer)
     (message "touching file %s" (buffer-file-name))
     (shell-command (concat "touch " 
         (shell-quote-argument (buffer-file-name))))
     (clear-visited-file-modtime))

;;;###autoload
(defun buffer-mode (buffer-or-string)
"Returns the major mode associated with a buffer."
    (with-current-buffer buffer-or-string
        major-mode))

;;;###autoload
(defun remove-char (str from to)
"Removes a character from an input string"
    (interactive)
    (let ((newstr str))
    (when (string-match from str)
        (setq newstr (replace-match to nil nil str)))

    newstr))

;;;###autoload
(defun local-replace-string (from to)
"Performs a string replacement in the current buffer using a from regex and 
a replacement string"
    (save-excursion
       (goto-char (point-min))
       (while (re-search-forward from nil t)
            (replace-match to nil nil))))

;;;###autoload
(defun make-plugin-path (plugin)
  (expand-file-name
   (concat plugin-path plugin)))

;;;###autoload
(defun include-plugin (plugin)
  (add-to-list 'load-path (make-plugin-path plugin)))

;;;###autoload
(defun make-elget-path (plugin)
  (expand-file-name
   (concat elget-path plugin)))

;;;###autoload
(defun include-elget-plugin (plugin)
  (add-to-list 'load-path (make-elget-path plugin)))

;;;###autoload
(defun update-buffer-list ()
  "When a file is opened this function is called to update the current buffer
  list by calling the revert function.  If this is not called you have to
  refresh the list manually.  This ensures that files are added to the list
  as they are opened."
      (interactive)
          (or 
              (when (setq buffer (get-buffer-window "*Buffer List*"))
                  (with-selected-window buffer
                      (revert-buffer)))
              (when (setq buffer (get-buffer "*Buffer List*"))
                  (with-current-buffer buffer
                      (revert-buffer)))))

(provide 'elib)
