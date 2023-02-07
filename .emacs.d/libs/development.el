;; My custom development functions for emacs
;;

(require 'term)
(require 'elib)
(require 'window-number)
(require 'ssh-terminals)
(with-no-warnings (require 'cl-lib))

(defun capitalize-letter ()
"Attempts to capitalize the current letter under the current point and then
move forward one position"
    (interactive)
    (let ((pos (point)))
        (capitalize-region pos (+ pos 1))
        (forward-char)))

(defun trim-trailing-spaces ()
"Removes all trailing whitespace from every line in the current buffer"
    (interactive)
    (save-excursion
        (local-replace-string " +$" "")))

(defun select-current-line ()
"Select the current line with a point and mark"
    (interactive)
    (beginning-of-line)
    (push-mark (point) t t)
    (end-of-line))

(defun duplicate-line()
    (interactive)
    (move-beginning-of-line 1)
    (kill-line)
    (yank)
    (open-line 1)
    (next-line 1)
    (yank)
)

(defun exchange-point-an-mark-no-transient ()
"Performs the code to exchange the point and mark, but ensures that the
transient mark mode is not enabled when it does"
    (interactive)
    (exchange-point-and-mark transient-mark-mode))

(defun goto-match-paren (arg)
"Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
    (interactive "p")
    (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun switch-to-minibuffer-window ()
"switch to minibuffer window (if active)"
    (interactive)
    (when (active-minibuffer-window)
        (select-window (active-minibuffer-window))))

(defun vi-open-line-above ()
"Insert a newline above the current line and put point at beginning.  This is
the vi equivalent function."
    (interactive)
    (unless (bolp)
        (beginning-of-line))
    (newline)
    (forward-line -1)
    (indent-according-to-mode))

(defun vi-open-line-below ()
"Insert a newline below the current line and put point at beginning.  This is
the vi equivalent function."
    (interactive)
    (unless (eolp)
        (end-of-line))
    (newline-and-indent))

(defun whack-whitespace (arg)
"Delete all white space from point to the next word. With prefix ARG
delete across newlines as well. The only danger in this is that you
don't have to actually be at the end of a word to make it work. It
skips over to the next whitespace and then whacks it all to the next word."
    (interactive "P")
    (let ((regexp (if arg "[ \t\n]+" "[ \t]+")))
        (re-search-forward regexp nil t)
        (replace-match "" nil nil)))

(defun open-terminal (&optional buffer-name)
"Opens an ansi terminal in the home directory.  It prompts for a name for the
shell to help distinguish between multiple open ansi shell buffers."
    (interactive "sTerminal Name: ")
    (or (boundp 'buffer-name) (setq buffer-name ""))

    (let* ((shell-cmd "/bin/bash"))
        (cd root.dir)

        (if (and buffer-name (not (string= buffer-name "")))
            (ansi-term shell-cmd buffer-name)
          (ansi-term shell-cmd))))

(defun remote-term (buffer-name cmd &rest switches)
"Opens a terminal to a remote host.  The normal ansi-term function does
not allow for parameters to be passed to the shell that it opens.  This
custom function allows for an ssh session to be opened."
    (setq term-ansi-buffer-name buffer-name)
    (setq term-ansi-buffer-name
        (generate-new-buffer-name term-ansi-buffer-name))
    (setq term-ansi-buffer-name
        (apply 'term-ansi-make-term term-ansi-buffer-name cmd nil switches))
    (set-buffer term-ansi-buffer-name)
    (term-mode)
    (term-char-mode)
    (switch-to-buffer term-ansi-buffer-name))

(defun open-ssh-term (location)
"Takes an ssh location that I specify and opens a remote ssh session to that
server.  The location is the name string associated with the ssh session.
This is stored in ssh-terminals.el.  This is a global list of all sessions."
    (interactive "sLocation: ")
    (let* ((server (cdr (assoc location ssh-terminal-locations))))

       (if (or (string= location "")
               (string= location "local")
               (string= location "terminal")
               (string= location "term"))
             (open-terminal server)
         (if (and (boundp 'server) server)
           (progn
               (message "Opening server (%s): %s" location server)
               (remote-term (concat "ssh:" server) "ssh" server))
             (message "Invalid ssh server string requested.")))))

(defun open-ssh-buffer (location)
"Opens up a tramp session to the specified server.  The location is the
name string associated with the ssh session.  This is stored in
ssh-terminals.el.  This is a global list of all sessions."
    (interactive "sLocation: ")
    (let* ((server (cdr (assoc location ssh-terminal-locations))))

       (if (and (boundp 'server) server)
            (progn
               (message "Opening server (%s): %s" location server)
               (find-file (concat "/ssh:" server ":"))
               (rename-buffer (concat "ssh:" location)))
            (message "Invalid ssh server string requested."))))

(defun toggle-term-mode ()
"Toggles between the char/line mode values in a terminal session."
    (interactive)
    (if (term-in-char-mode)
        (term-line-mode)
      (term-char-mode)))

(defun ssh-list ()
"Prints the current list of ssh terminals that are available"
    (interactive)

    (let ((buffer-name "*ssh:list*"))
        (if (not (get-buffer buffer-name))
            (progn
                (message "%s doesn't exist, opening buffer" buffer-name)
                (get-buffer-create buffer-name)
                (set-buffer buffer-name)
                (erase-buffer)

                (insert "                   *** ssh terminal list *** \n")
                (hline)
                (dolist (location ssh-terminal-locations)
                    (insert (format "%20s" (car location))
                        " : (" (cdr location) ")\n"))

                (setq buffer-read-only t)
                (switch-to-buffer buffer-name)))))

(defun select-word ()
"Selects the current word under the cursor.  It finds the start and end
of the word and sets the correct marker points"
    (interactive)
    (skip-chars-backward "-_A-Za-z0-9")
    (set-mark (point))
    (skip-chars-forward "-_A-Za-z0-9"))

(defun run-python-script (script)
"Compiles and executes a python script.  It saves all buffers before this command is
executed.  The current buffer is passed as the only parameter to the script."
    (interactive)
    (save-buffer)
    (compile (concat
       script " --filename " (buffer-file-name))))

(defun build-references()
"Executes a shell script to build the bibtex references"
    (interactive)
    (shell-command "bash -c build-references.sh"))

(defun show-file-name ()
"Show the full path file name in the minibuffer.  It also adds the
name to the kill ring so that it can be pasted."
    (interactive)
    (let ((buffer-name (buffer-file-name)))
        (message "%s" buffer-name)
        (kill-new buffer-name)))

(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
"Kills the buffer that remains after an ansi terminal is exited"
    (let (buffer)
        (if (eq (process-status proc) 'exit)
            (let ((buffer (process-buffer proc)))
                ad-do-it
                (kill-buffer buffer)
            )
          ad-do-it)))
(ad-activate 'term-sentinel)

(defun toggle-terminal-window ()
"Switches between the terminal window and the previous window"
    (interactive)
    (if (eq (window-number) 5)
        (other-window previous-window-number)
        (progn
            (setq previous-window-number (window-number))
            (window-number-select 5))))

(defun toggle-editing-modes ()
"A convenience function to toggle between asciidoc and org modes for editing.
Asciidoc is the main mode, but org is used to edit tables."
    (interactive)
    (save-excursion
        (let* ((mode (buffer-mode (current-buffer))))
            (if (string= mode 'asciidoc-mode)
                (progn
                    (org-mode)))
            (if (string= mode 'org-mode)
                (progn
                    (asciidoc-mode))))))

(defun markdown-preview-file ()
"run Marked on the current file and revert the buffer"
    (interactive)
    (shell-command
       (format "open -a /Applications/MacDown.app %s"
           (shell-quote-argument (buffer-file-name)))))

(defun indent-region-custom(numSpaces)
  (progn
    (setq regionStart (line-beginning-position))
    (setq regionEnd (line-end-position))
    (when (use-region-p)
      (setq regionStart (region-beginning))
      (setq regionEnd (region-end)))

    (save-excursion
      (goto-char regionStart)
      (setq start (line-beginning-position))
      (goto-char regionEnd)
      (setq end (line-end-position))

      (indent-rigidly start end numSpaces)
      (setq deactivate-mark nil))))

(defun untab-region (N)
  (interactive "p")
  (indent-region-custom -4))

(defun tab-region (N)
  (interactive "p")
  (if (active-minibuffer-window)
    (minibuffer-complete)

  (if (use-region-p)
      (indent-region-custom 4)
    (insert "\t"))))

(defun new-buffer-frame()
"Create a new frame with a new empty buffer."
    (interactive)
        (let ((buffer (generate-new-buffer "untitled")))
            (set-buffer-major-mode buffer)
            (display-buffer buffer '(display-buffer-same-window . nil))
            (switch-to-buffer buffer)
            (set-buffer-modified-p t)))

(defun end-line-semicolon()
"Moves to the end of the current line, adds a semicolon and a newline"
    (interactive)
    (end-of-line)
    (insert ";\n")
    (indent-according-to-mode))

(provide 'development)
