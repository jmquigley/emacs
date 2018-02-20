Emacs
=====
My Emacs configuration.  This is a reorganization of my current setup.  It was inspired by [jhamrick's layout](https://github.com/jhamrick/emacs), which has a nice, organized layout.  This setup uses the built in [package](https://www.emacswiki.org/emacs/InstallingPackages) facility.


Requirements
------------
Emacs 25.2+
Linux, OSX, or Windows


Installation
------------
To use this clone the repo and run the script `./install.sh` in a Linux or OSX environment.  To use in a Windows environment run the script `install.cmd` (with powershell).  This does **NOT** backup your current `.emacs.d` directory in your home directory; it performs a fresh install.  When Emacs starts for the first time on a fresh install there will be a delay (it will look like the app is frozen).  The initial install of the packages takes some time to download and install.


Packages
--------

- [auto-complete](https://melpa.org/#/auto-complete)
- [autopair](https://melpa.org/#/autopair)
- [bookmark+](https://www.emacswiki.org/emacs/BookmarkPlus)
- [centered-cursor-mode](https://melpa.org/#/centered-cursor-mode)
- [cmake-mode](https://melpa.org/#/cmake-mode)
- [company](https://melpa.org/#/company)
- [devdocs](https://melpa.org/#/devdocs)
- [dictionary](https://melpa.org/#/dictionary)
- [dockerfile-mode](https://melpa.org/#/dockerfile-mode)
- [elpy](https://melpa.org/#/elpy)
- [expand-region](https://melpa.org/#/expand-region)
- [fill-column-indicator](https://melpa.org/#/fill-column-indicator)
- [flycheck](https://melpa.org/#/flycheck)
- [ggtags](https://melpa.org/#/ggtags)
- [git-blamed](https://melpa.org/#/git-blamed)
- [google-c-style](https://melpa.org/#/google-c-style)
- [groovy-mode](https://melpa.org/#/groovy-mode)
- [haml-mode](https://melpa.org/#/haml-mode)
- [hl-line+](https://www.emacswiki.org/emacs/hl-line%2b.el)
- [jedi](https://melpa.org/#/jedi)
- [js2-mode](https://melpa.org/#/js2-mode)
- [json-mode](https://melpa.org/#/json-mode)
- [lorem-ipsum](https://melpa.org/#/lorem-ipsum)
- [magit](https://melpa.org/#/magit)
- [markdown-mode](https://melpa.org/#/markdown-mode)
- [move-text](https://melpa.org/#/move-text)
- [neotree](https://melpa.org/#/neotree)
- [php-mode](https://melpa.org/#/php-mode)
- [projectile](https://melpa.org/#/projectile)
- [pydoc-info](https://melpa.org/#/pydoc-info)
- [python-mode](https://melpa.org/#/python-mode)
- [rainbow-delimiters](https://melpa.org/#/rainbow-delimiters)
- [rjsx-mode](https://melpa.org/#/rjsx-mode)
- [slime](https://melpa.org/#/slime)
- [smooth-scrolling](https://melpa.org/#/smooth-scrolling)
- [tidy](https://www.emacswiki.org/emacs/tidy.el)
- [typescript-mode](https://melpa.org/#/typescript-mode)
- [undo-tree](https://melpa.org/#/undo-tree)
- [virtualenvwrapper](https://melpa.org/#/virtualenvwrapper)
- [web-mode](https://melpa.org/#/web-mode)
- [window-number](http://www.emacswiki.org/NumberedWindows)
- [ws-butler](https://melpa.org/#/ws-butler)
- [yaml-mode](https://melpa.org/#/yaml-mode)
- [yasnippet](https://melpa.org/#/yasnippet)

It also contains two custom modes that I wrote:

- [asciidoc-mode](https://github.com/jmquigley/asciidoc-mode)
- [mmd-mode](https://github.com/jmquigley/mmd-mode) (multimarkdown mode, a derivative of markdown-mode)
