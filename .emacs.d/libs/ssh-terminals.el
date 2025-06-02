;; Contains the definitions for all of my remote sessions based on the
;; name of the location.
;;

;;;###autoload
(defcustom ssh-terminal-locations `(
  ("" . "terminal")
  ("local" . "terminal")
  ("term" . "terminal")
  ("terminal" . "terminal")

  ("appserver" . "root@appserver.local")
)

"The list of all current ssh terminals that I can log into.  The first column
should be twenty characters or less. This keeps the formatting for the
ssh-list command from breaking."
:group 'ssh-terminals)

(provide 'ssh-terminals)
