;; This is a list of commands that are used to setup the windows in a
;; development environment

(require 'development)

;; Functions that can be used to horizontally resize windows
(defun fix-frame-horizontal-size (width)
"Set the frame's size to 85 (or prefix arg WIDTH) columns wide."
    (interactive "P")
    (if window-system
        (set-frame-width (selected-frame) (or width 85))
        (error "Cannot resize frame horizontally: is a text terminal")))

    (defun fix-window-horizontal-size (width)
        "Set the window's size to 85 (or prefix arg WIDTH) columns wide."
        (interactive "P")
        (enlarge-window (- (or width 85) (window-width)) 'horizontal))

    (defun fix-horizontal-size (width)
        "Set the window's or frame's width to 85 (or prefix arg WIDTH)."
        (interactive "P")
        (condition-case nil (fix-window-horizontal-size width)
        (error
        (condition-case nil (fix-frame-horizontal-size width)
        (error
        (error "Cannot resize window or frame horizontally"))))))

    (eval-after-load "dired"
        '(progn
            (define-key dired-mode-map "f" 'my-dired-find-file)
            (defun my-dired-find-file (&optional arg)
                "Open each of the marked files, or the file under the point,
                 or when prefix arg, the next N files "
                (interactive "P")
                (let* ((fn-list (dired-get-marked-files nil arg)))
                (mapc 'find-file fn-list)))))

(defun open-default-programs ()
"Opens a list of default programs/buffers that are common to all sessions"
    (cd root.dir)
    (list-buffers))

(defun open-default-buffers ()
"Opens a list of default buffers common to all windows"
    (bookmark-bmenu-list)
    (open-default-programs))

(defun setup-development-windows ()
"Development function to quickly configure windows"
    (interactive)
    (open-default-buffers)

    (split-window-horizontally)
    (switch-to-buffer "*Buffer List*")
    (split-window-vertically)
    (other-window 1)
    (switch-to-buffer "*Messages*")
    ;; (ssh-list)
    (other-window 1)
    (split-window-horizontally)
    (switch-to-buffer "*scratch*")
    ;; (term (getenv "SHELL"))
    (split-window-horizontally)
    (balance-windows)
    (other-window 1)
    (switch-to-buffer "*Bookmark List*")
    (other-window 1)
    (switch-to-buffer "*compilation*")
    (other-window 1)
    (fix-horizontal-size 90)
    (other-window 3))

(defun setup-editing-windows()
"Editor function to setup quick editing session for the laptop"
    (interactive)
    (open-default-buffers)

    (split-window-horizontally)
    (switch-to-buffer "*Buffer List*")
    (fix-horizontal-size 90)
    (split-window-vertically)
    (other-window 1)
    (switch-to-buffer "*Messages*")
    (other-window 1)
    (switch-to-buffer "*Bookmark List*"))

(defun setup-simple-windows()
  "Editor function to setup a single window interface.  It opens up
   the buffer and bookmarks for use, but only shows the bookmarks"
    (interactive)
    (open-default-buffers)
    (switch-to-buffer "*Bookmark List*"))

(defun setup-triple-windows()
  "Editor function to setup three evenly spaced horizontal windows"
  (interactive)
  (open-default-buffers)
  (switch-to-buffer "*scratch*")
  (split-window-horizontally)
  (other-window 1)
  (switch-to-buffer "*Buffer List*")
  (neotree-toggle)
  (other-window 1)
  (balance-windows)
)

(provide 'windows)
