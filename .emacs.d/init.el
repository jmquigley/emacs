(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path "~/.emacs.d/libs")
(add-to-list 'load-path "~/.emacs.d/3rd-party")

(defvar root.dir (expand-file-name "~/"))
(defvar conf.dir (concat user-emacs-directory "settings/"))
;; (toggle-debug-on-error)

(require 'package)

(setq package-list '(
	auto-complete
	autopair
	bookmark+
	centered-cursor-mode
	cmake-mode
	company
	devdocs
	dictionary
	expand-region
	fill-column-indicator
	flycheck
	ggtags
	git-blamed
	google-c-style
	groovy-mode
	haml-mode
	hl-line+
	jedi
	js2-mode
	json-mode
	lorem-ipsum
	magit
	markdown-mode
	move-text
	neotree
	openwith
	php-mode
	projectile
	pydoc-info
	redo+
	rainbow-delimiters
	rjsx-mode
	slime
	smooth-scrolling
	tidy
	typescript-mode
	virtualenvwrapper
	web-mode
	window-number
	ws-butler
	yaml-mode
	yasnippet
	))

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)

; fetch the list of packages available
(when (not package-archive-contents)
      (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
	(unless (package-installed-p package)
		(package-install package)))

(require 'theme)
(require 'general-settings)
(require 'prettify-settings)
(require 'smooth-scroll-settings)
(require 'yasnippet-settings)
(require 'abbrev-settings)
(require 'magit-settings)
(require 'bookmark-settings)
(require 'org-mode-settings)
(require 'yaml-settings)
(require 'haml-settings)
(require 'ido-settings)
(require 'asciidoc-settings)
(require 'multimarkdown-settings)
(require 'restructuredtext-settings)
(require 'predictive-settings)
(require 'info-settings)
(require 'autocomplete-settings)
(require 'cdet-settings)
(require 'python-settings)
(require 'cperl-settings)
(require 'cmode-settings)
(require 'ruby-settings)
(require 'java-settings)
(require 'groovy-settings)
(require 'lisp-settings)
(require 'makefile-settings)
(require 'php-settings)
(require 'js-settings)
(require 'shell-settings)
(require 'html-settings)
(require 'cmake-mode-settings)
(require 'whitespace-settings)
(require 'buffer-settings)
(require 'openwith-settings)

(require 'keybindings)

(load
	(setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
	'noerror)
