(make-directory "~/.saves/" t)
(defvar backup-dir (expand-file-name "~/.saves/"))
(defvar autosave-dir (expand-file-name "~/.saves/"))

(setq default-directory root.dir)

;; Set the default line endings to use unix
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
(setq-default cursor-type 'box)

(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))

;; Global default variables
(setq auto-save-list-file-prefix autosave-dir
      auto-save-file-name-transforms `((".*" ,autosave-dir t))
      backup-by-copying t
      backup-directory-alist (list (cons ".*" backup-dir))
      browser (getenv "BROWSER")
      compilation-scroll-output t
	  compile-command (concat "cd " (getenv "PROJECT_ROOT") " && ./build.sh")
      default-major-mode 'text-mode
      delete-old-versions t
      dired-directory root.dir
      display-time-day-and-date t
      display-time-24hr-format t
      frame-title-format '((:eval default-directory))
      gdb-many-windows t
      gdb-restore-window-configuration-after-quit t
      inhibit-startup-message t
      initial-frame-alist '((width . 135)
                            (height . 65)
                            (top . 30)
                            (left . 300))
      initial-scratch-message nil
      initial-buffer-choice t
      kept-new-versions 6
      kept-old-versions 2
      large-file-warning-threshold nil
      magit-auto-revert-mode nil
      magit-last-seen-setup-instructions "1.4.0"
      pop-up-windows nil
      require-final-newline nil
      ring-bell-function 'ignore
      scroll-step 1
      show-paren-delay 0
      tab-always-indent nil
      tags-add-tables nil
      tags-table-list '("~/.emacs.d" "~/workspace")
      tramp-default-method "ssh"
      tramp-use-ssh-controlmaster-options nil
      transient-mark-mode t
	  undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))
      vc-follow-symlinks t
      version-control t
      virtualenv-workon "py3"
      virtualenv-default-directory "~/virtualenvs/py3"
      visual-bell t
      warning-minimum-level :emergency
)

(require 'cl-lib)

(require 'elib)
(require 'wiki-mode)
(require 'asciidoc-mode)
(require 'mmd-mode)
(require 'development)
(require 'ssh-terminals)
(require 'search)
(require 'move-text)

(require 'dictionary)
(require 'expand-region)
(require 'git-blamed)
(require 'undo-tree)
(require 'tidy)
(require 'fill-column-indicator)
(require 'realgud)

;; turn on the mouse wheel mode
(require 'mwheel)
(mouse-wheel-mode t)

;; turn off the menu, toolbar, scrollbar and tool tips
(when (or window-system (and (>= emacs-major-version 23) (daemonp)))
    (if (fboundp 'tool-bar-mode)
        (tool-bar-mode 0))
    (if (fboundp 'scroll-bar-mode)
        (scroll-bar-mode -1))
    (tooltip-mode 0))

(menu-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)

;; Automatically tails *.log files in a buffer
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))

;; Minor mode hooks that can be added to any major modes
(defun minor-mode-hooks ()
"A convenience function that is used to turn on minor modes
in some of the major modes that I use"
    (setq-default fill-column 80)
    (delete-selection-mode 1)
    (visual-line-mode 1)
    (hl-line-mode 1)
    (abbrev-mode 1)
    (add-keywords))

(defun development-minor-mode-hooks ()
"Minor mode values that are related to development modes"
    (minor-mode-hooks)
    (yas-minor-mode t)
    (rainbow-delimiters-mode t)
    (display-line-numbers-mode t)
    (show-paren-mode t))

(add-hook 'dired-mode-hook #'(lambda() (hl-line-mode t)))
(add-hook 'text-mode-hook 'minor-mode-hooks)

;; Puts the date/time in the status bar
(display-time)

;; Column number in the status bar
(require 'window-number)
(column-number-mode t)
(window-number-mode 1)

;; undo tree mode
(global-undo-tree-mode)

;; Enable the n00b disabled items
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Set what browser will be used to follow links if defined
(if (boundp 'browser)
    (progn
      (message "Using browser @ %s" browser)
      (setq browse-url-generic-program
          (executable-find browser)
          browse-url-browser-function 'browse-url-generic)
     )
  (message "BROWSER undefined in environment")
)

(provide 'general-settings)
