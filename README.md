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

- [auto-complete](http://www.emacswiki.org/emacs/AutoComplete)
- [autopair](http://www.emacswiki.org/emacs/AutoPairs)
- [bookmark+](http://www.emacswiki.org/BookmarkPlus)
- [centered-cursor-mode](http://www.emacswiki.org/emacs/centered-cursor-mode.el)
- [cmake-mode](https://cmake.org/Wiki/CMake/Editors/Emacs)
- [color-theme-solarized](https://github.com/sellout/emacs-color-theme-solarized)
- [company](https://melpa.org/#/company)
- [devdocs](https://melpa.org/#/devdocs)
- [dictionary](https://github.com/myrkr/dictionary-el)
- [expand-region](https://github.com/magnars/expand-region.el)
- [fill-column-indicator](https://melpa.org/#/fill-column-indicator)
- [flycheck](https://flycheck.readthedocs.org/en/latest/)
- [ggtags](https://github.com/leoliu/ggtags)
- [git-blamed](https://melpa.org/#/git-blamed)
- [google-c-style](https://google-styleguide.googlecode.com/svn/trunk/google-c-style.el)
- [groovy-mode](https://melpa.org/#/groovy-mode)
- [haml-mode](https://github.com/nex3/haml-mode)
- [hl-line+](http://www.emacswiki.org/hl-line+.el)
- [jedi](http://tkf.github.io/emacs-jedi/latest/)
- [js2-mode](http://www.emacswiki.org/Js2Mode)
- [json-mode](https://melpa.org/#/json-mode)
- [lorem-ipsum](http://www.emacswiki.org/emacs/lorem-ipsum.el)
- [magit](http://magit.github.io/)
- [markdown-mode](http://jblevins.org/projects/markdown-mode/)
- [monokai-theme](https://melpa.org/#/monokai-theme)
- [move-text](http://www.emacswiki.org/emacs/move-text.el)
- [php-mode](http://www.emacswiki.org/PhpMode)
- [pydoc-info](https://melpa.org/#/pydoc-info)
- [python-mode](https://launchpad.net/python-mode)
- [redo+](http://www.emacswiki.org/RedoPlus)
- [rjsx-mode](https://github.com/felipeochoa/rjsx-mode)
- [slime](https://melpa.org/#/slime)
- [smooth-scrolling](http://www.emacswiki.org/emacs/SmoothScrolling)
- [tide](https://melpa.org/#/tide)
- [tidy](http://www.emacswiki.org/emacs/tidy.el)
- [typescript-mode](https://melpa.org/#/typescript-mode)
- [virtualenvwrapper](https://bitbucket.org/dhellmann/virtualenvwrapper/)
- [web-mode](https://melpa.org/#/web-mode)
- [window-number](http://www.emacswiki.org/NumberedWindows)
- [ws-butler](https://melpa.org/#/ws-butler)
- [yaml-mode](http://www.emacswiki.org/YamlMode)
- [yasnippet](https://github.com/capitaomorte/yasnippet)

It also contains two custom modes that I wrote:

- [asciidoc-mode](https://github.com/jmquigley/asciidoc-mode)
- [mmd-mode](https://github.com/jmquigley/mmd-mode) (multimarkdown mode, a derivative of markdown-mode)
