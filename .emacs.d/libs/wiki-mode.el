;; wiki-mode.el -- Wiki operations for restructured text
;;
;; A specialized minor mode that works with restructured text and sphinx.  It
;; make the restructured text documents that are part of the sphinx system
;; into a wiki within emacs.  Each of the links in a sphinx document can be
;; "followed" with "C-c f".  This will attempt to open the file reference
;; at that point.  This relies on the shell to open 3rd party applications
;; to files that cannot be opened via emacs.  Certain types of files, like
;;  .rst files, are opened within an emacs buffer.
;;
;; Environment variables that can be used to define the location of
;; external applications that will be used by the script to open
;; files.
;;
;; EXCEL_EXE
;; FIREFOX_EXE
;; PDF_EXE
;; POWERPOINT_EXE
;; WORD_EXE
;;
;; James Quigley
;; Created: 01/05/2013
;;
(require 'elib)

(defconst wiki-mode-version "0.1")

(defvar wiki-mode-map nil "Keymap for wiki-mode")
"Keyboard mapping for wiki-mode."
(setq wiki-mode-map (make-sparse-keymap))
(define-key wiki-mode-map (kbd "C-c f") 'wiki-mode-follow-link)
(define-key wiki-mode-map (kbd "C-c t") 'wiki-mode-search-tag)
(define-key wiki-mode-map (kbd "C-c s") 'wiki-mode-search-keyword)

;;;###autoload
(defvar wiki-mode-file-types '("*.rst" "*.md" "*.asciidoc"))
"The list of valid wiki file types that can be searched"

;;;###autoload
(defvar wiki-mode-search-exclude '("Environment" "Wiki" "Workspace"))
"The list of directories that will be excludeed from the tag search"

;;;###autoload
(defcustom wiki-mode-applications `(
    (".asciidoc" . emacs)
    (".doc" . word.sh) (".docx" . word.sh)
    (".exe" . bash)
    (".gif" . imageviewer.sh)
    (".html" . browser.sh) (".htm" . browser.sh)
    (".htm" . firefox.sh)
    (".jpg" . imageviewer.sh) (".jpeg" . imageviewer.sh)
    (".md" . emacs)
    (".pdf" . pdf.sh)
    (".png" . imageviewer.sh)
    (".ppt" . powerpoint.sh)
    (".rst" . emacs)
    (".txt" . emacs)
    (".wmv" . wmplayer.sh)
    (".xls" . excel.sh) (".xlsx" . excel.sh)
    (".xmind" . mindmap.sh)
    (".xml" . emacs))
"The list of file extensions and their associated applications.  When
the wiki-mode tries to follow a file of this extension it will attempt
to open that file using the associated program.  If there is no
extension, then no attempt will be made to open it.  Each of the programs
should have a wrapper .sh (bash) script associated with it to simplify the
opening of the programs.  The programs will be passed to the function
shell-command.  The shell will execute the script and start the
program.  The only special value in this list is emacs.  That value
will open the file in a buffer within this program."
:group 'wiki
)

;;;###autoload
(define-minor-mode wiki-mode
"Toggles the use of the wiki mode.  The wiki mode turns a buffer into a
wikified page allowing the user to follow links to other buffers, files,
and links."
:init-value nil
:lighter " wiki"
:keymap wiki-mode-map
)

(defun wiki-mode-follow-link ()
"Searches for a wiki type link at the current cursor point and line
and attempts to open it in the proper program related to that
reference"
    (interactive)
    (let (str pos (reference (wiki-mode-get-reference-at-point)))
        (cond ((setq str (wiki-mode-get-local-link reference))
               (wiki-mode-parse-local-link str))

              ((setq pos (wiki-mode-get-local-reference reference))
               (message "pos: %d" pos)
               (wiki-mode-parse-local-reference pos))

              ((setq str (wiki-mode-get-local-file reference))
               (wiki-mode-parse-local-file str))
        )
    )
)

(defun wiki-mode-parse-local-link (link)
"Takes a restructued text link and parses it to retrieve the link
to the site or file."
    (message "parsing local link: %s" link)

    (let (start end filename application)
        (string-match "\\.\\. _.*: " link)
        (setq start (match-end 0))
        (setq end (length link))
        (setq filename (substring link start end))

        ;; remove the protocol decriptor on the front of the filename
        (if (string-match "^file:\\/*"  filename)
            (progn
                (setq start (match-end 0))
                (setq end (length filename))
                (setq filename (substring filename start end))
        ))

        ;; Replace internet characters with their UTF-8 equivalent
        (setq filename (replace-regexp-in-string "\\%20" " " filename))

        (setq application (wiki-mode-get-application-from-file filename))
        (message "application: %s" application)
        (wiki-mode-execute-file filename application)
    )
)

(defun wiki-mode-get-local-link(search)
"Searches the current buffer for a restructured text link definition.
If it is found, the definition is returned.  If not, nil is returned.
It searches for a string in the format:  .. _{string}: {link}"
    (message "searching for local link: %s" search)
    (wiki-mode-search (concat "\\.\\. _" search "\\: .*"))
)

(defun wiki-mode-parse-local-reference (pos)
"Takes a restructed text footnote and parses it to retrieve the link
to the document or site."
    (message "parsing local reference at %d" pos)
    (push-mark (point))
    (if pos (goto-char pos))
    (beginning-of-line)
)

(defun wiki-mode-get-local-reference (search)
"Searches the current buffer for a restructured text footnote reference
definition.  If it is found, the definition is returned.  If not, nil
is returned.  It searches for a string in the format:
.. [{reference}] {link}"
    (message "searching for local reference: %s" search)
    (wiki-mode-search-position (concat "\\.\\. \\[" search "\\] .*"))
)

(defun wiki-mode-parse-local-file (link)
"Takes a file reference, parses it and attempts to open it into a buffer"
    (message "parsing local file: %s" link)

    (let* (filename application extension done
        (app (wiki-mode-get-application-from-file link))
        (application (cdr app))
        (extension (car app)))

        (message "application: %s, extension: %s" application extension)

        (if (file-exists-p link)
            (wiki-mode-execute-file (file-truename link) app))
        )
)

(defun wiki-mode-get-local-file (link)
"Takes the restructured text file link and attempts to strip out the file
name reference.  There are two types of file links.  The first occurs in
a toc element.  The second is a reference between < and >"
    (message "searching for local file: %s" link)

    (let (filename (link (trim-string link)))
    (or (setq filename (wiki-mode-search "<.*>" t))
        (setq filename (wiki-mode-search "\\.\\. image:: .*" t))
        (setq filename link))

        (setq filename (replace-regexp-in-string "\\.\\. image:: " "" filename))
        (setq filename (replace-regexp-in-string "^<" ""
        (replace-regexp-in-string ">$" "" filename)))

        (if (not (file-name-extension filename))
            (dolist (app wiki-mode-applications)
                (setq str (format "%s%s" filename (car app)))
                (if (file-exists-p str) (setq filename str))))

        filename
    )
)

(defun wiki-mode-search (search &optional line-only)
"Generalized search routine.  It is passed a simple regex express and this
search routing will search the buffer for it.  It returns the string
that is found in the buffer that matches.  If the line-only flag is set
then the search will only look at that line for the search instead of the
whole buffer."
    (message "wiki search: %s, line-only: %s" search line-only)
    (save-excursion
        (beginning-of-line)
        (or (boundp 'line-only) (setq line-only nil))

        (if line-only
            (if (re-search-forward search (line-end-position) t)
                (match-string 0 nil))
            (if (re-search-forward search (point-max) t)
                (match-string 0 nil))
        )
    )
)

(defun wiki-mode-search-position (search)
"Generalized search routine that will take the search string and find its
point position within the buffer.  It returns the point.  If it is not
found it will return nil."
    (save-excursion
        (beginning-of-line)
        (re-search-forward search (point-max) t)
    )
)

(defun wiki-mode-execute-file (filename application)
"This function takes a FILENAME string and attempts to open it via
the shell command.  It uses the extension on the FILENAME to
determine what program it will use to open it.  It also passes a
parameter that contains the extension and the program that is used to
 open it."
    (let (cmd
         (extension (car application))
         (program (cdr application)))
        (message "opening \'%s\' with \'%s\'" filename program)
        (cond ((string= program "emacs") (find-file filename))
              ((string= program "bash") (progn

                  ;; TODO: test this it may be broken

                  (wiki-mode-shell-wrapper cmd (current-buffer))
              ))
              (t (progn
                  (setq cmd (format "%s '%s' &" program filename))
                  (wiki-mode-shell-wrapper cmd (current-buffer))
              ))
        )
    )
)

(defun wiki-mode-shell-wrapper (cmd buffer)
"Custom shell wrapper that calls a shell command and immediately
changes back to the buffer that called the command."
    (let ((out "*Shell Output*"))
        (message "shell command: %s" cmd)
        (shell-command cmd out)
        (switch-to-buffer buffer))
)


(defun wiki-mode-get-reference-at-point (&optional current-point)
"Looks for the start and end of a wiki type reference.  It returns
a string that represents the reference"
    (or current-point (setq current-point (point)))
    (goto-char current-point)
    (save-excursion
        (let (str begin end)
            (skip-chars-backward "^([`\n")
            (setq begin (point))
            (skip-chars-forward "^(]`\n")
            (setq end (point))
            (setq str (trim-string (buffer-substring-no-properties begin end)))
        )
    )
)

(defun wiki-mode-get-application-from-file (filename)
"Retrieves the application association from an input filename"
    (let (extension)
        (if (string-match "^http[s]?:\\/*" filename)
          (progn
              (assoc ".html" wiki-mode-applications))
          (progn
              (setq extension (file-name-extension filename t))
              (assoc extension wiki-mode-applications))
        )
    )
)

(defun wiki-mode-search-tag (tag)
"Searches all files that are in the wiki for tag references.  In restructured
text it uses a comment: .. Tags: {tag}; {tag}
The files in the wiki are searched and a list of files that have these tags
are returned in a buffer.  That buffer can then be followed"
    (interactive "sTag: ")
    (let (cmd (output-buffer "*Wiki Tag Search*"))
        (save-excursion
            (call-interactively 'cd)

            (setq cmd (concat "cd " default-directory " && "))
            (setq cmd (concat cmd (wiki-mode-build-search)))
            (setq cmd (concat cmd " -exec grep -ln \":tags:.*" tag ".*\" {} \\; &"))

            (get-buffer-create output-buffer)
            (set-buffer output-buffer)
            (shell-command cmd output-buffer)
            (insert (format "Searching for wiki tag \'%s\' using find command:\n" tag))
            (insert (format "%s\n" cmd))
        )
    )
)

(defun wiki-mode-search-keyword (keyword)
"Performs a search through the entire wiki for a keyword"
    (interactive "sKeyword: ")
    (let (cmd (output-buffer "*Wiki Keyword Search*"))
        (save-excursion
            (call-interactively 'cd)

            (setq cmd (concat "cd " default-directory " && "))
            (setq cmd (concat cmd (wiki-mode-build-search)))
            (setq cmd (concat cmd " -exec grep -ln \"" keyword "\" {} \\; &"))

            (get-buffer-create output-buffer)
            (set-buffer output-buffer)
            (shell-command cmd output-buffer)
            (insert (format "Searching for wiki keyword \'%s\' using find command:\n" keyword))
            (insert (format "%s\n" cmd))
        )
    )
)

(defun wiki-mode-build-search ()
"Builds a reusable find string for keyword searches"
    (let (cmd first done type exclusion (join ""))

        (setq cmd "find * \\(")
        (dolist (exclusion wiki-mode-search-exclude)
             (if first (setq join " -o"))
             (setq first t)
             (setq cmd (concat cmd join " -name " exclusion " -prune")))
        (setq cmd (concat cmd " \\) -o \\("))

        (setq done nil first nil join "")
        (dolist (type wiki-mode-file-types)
            (if first (setq join " -o"))
            (setq first t)
            (setq cmd (concat cmd join " -name \"" type "\"")))
        (setq cmd (concat cmd " \\)"))
    )
)

(defun wiki-mode-show-applications ()
"Prints out the current list of all applications and their program
associations."
    (interactive)
    (dolist (app wiki-mode-applications)
        (message "%s, key=%s, value=%s" app (car app) (cdr app)))
)

(provide 'wiki-mode)
