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

(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))

(setq browse-url-generic-program
    (executable-find (getenv "BROWSER"))
     browse-url-browser-function 'browse-url-generic)

;; Global default variables
(setq default-major-mode 'text-mode
      inhibit-startup-message t
      initial-scratch-message nil
      initial-buffer-choice t
      ring-bell-function 'ignore
      magit-auto-revert-mode nil
      magit-last-seen-setup-instructions "1.4.0"
      tags-table-list '("~/.emacs.d" "~/workspace")
      visual-bell t
      vc-follow-symlinks t
      backup-by-copying t
      backup-directory-alist (list (cons ".*" backup-dir))
      auto-save-list-file-prefix autosave-dir
      auto-save-file-name-transforms `((".*" ,autosave-dir t))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      display-time-day-and-date t
      display-time-24hr-format t
      scroll-step 1
      compilation-scroll-output t
      pop-up-windows nil
      require-final-newline nil
      frame-title-format '((:eval default-directory))
      grep-find-template
          "find * <X> -type f <F> -exec grep <C> -nH -e <R> {} +"
      tags-table-list '("~/.emacs.d")
      transient-mark-mode t
      tramp-default-method "ssh"
      tramp-use-ssh-controlmaster-options nil
      linum-format "%4d\u2502"
      show-paren-delay 0
      dired-directory root.dir
      tab-stop-list (number-sequence 4 200 4)
      virtualenv-workon "py27"
      virtualenv-default-directory "~/virtualenvs/py27"
      initial-frame-alist '((font . "Consolas-9")
                            (width . 135)
                            (height . 65)
                            (top . 30)
                            (left . 300)
                            (foreground-color . "white")
                            (background-color . "black"))
)

(if (eq system-type 'darwin)
(setq initial-frame-alist '(
    (font . "Menlo-10")
    (width . 135)
    (height . 65)
    (top . 30)
    (left . 300)
    (foreground-color . "white")
    (background-color . "black"))
))

(require 'cl-lib)

(require 'elib)
(require 'wiki-mode)
(require 'asciidoc-mode)
(require 'mmd-mode)
(require 'development)
(require 'theme)
(require 'ssh-terminals)
(require 'search)
(require 'move-text)

(require 'autopair)
(require 'dictionary)
(require 'expand-region)
(require 'git-blamed)
(require 'redo+)
(require 'tidy)

;; (require 'keybindings)

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
    (rainbow-delimiters-mode t)
    (linum-mode 1)
    (show-paren-mode t))

(add-hook 'dired-mode-hook '(lambda() (hl-line-mode t)))
(add-hook 'text-mode-hook 'minor-mode-hooks)

;; Puts the date/time in the status bar
(display-time)

;; Column number in the status bar
(require 'window-number)
(column-number-mode t)
(window-number-mode 1)

;; autopair mode
(require 'autopair)
(autopair-global-mode)

;; Enable the n00b disabled items
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(provide 'general-settings)
