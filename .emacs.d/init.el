(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path "~/.emacs.d/libs")
(add-to-list 'load-path "~/.emacs.d/3rd-party")

(defvar root.dir (expand-file-name "~/"))
(defvar emacs.dir (concat root.dir ".emacs.d/"))
(defvar conf.dir (concat emacs.dir "settings/"))
(toggle-debug-on-error)

(require 'package)

(setq package-list '(
	auto-complete
	autopair
	bookmark+
	centered-cursor-mode
	cmake-mode
	color-theme-solarized
	dictionary
    electric-spacing
	expand-region
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
	monokai-theme
	move-text
	php-mode
	pydoc-info
	python-mode
	redo+
    rjsx-mode
	ruby-mode
    slime
	smooth-scrolling
	tidy
	tern
    tern-auto-complete
	typescript-mode
	virtualenvwrapper
	window-number
	ws-butler
	yaml-mode
	yasnippet
	))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
	(package-refresh-contents))

; install the missing packages
(dolist (package package-list)
	(unless (package-installed-p package)
		(package-install package)))

(require 'general-settings)
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
(require 'html-settings)
(require 'cmake-mode-settings)
(require 'whitespace-settings)
(require 'buffer-settings)

(load-theme 'monokai t)

(load
	(setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
	'noerror)
