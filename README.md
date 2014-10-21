Emacs
=====
My Emacs configuration.  This is a reorganization of my current setup.  It was inspired by [jhamrick's layout](https://github.com/jhamrick/emacs).  It has a nice, organized layout.  This setup also uses [el-get](https://github.com/dimitri/el-get) to manage the packages and their dependencies.  The environment must be configured to use this tool (such as version control command line tools like git, mercurial, bazaar, etc).  

This setup uses the following Emacs packages:

- auctex
- auto-complete
- autopair
- bookmark+
- color-theme-solarized
- dictionary
- el-get
- expand-region
- flycheck
- fuzzy
- git-blame
- google-c-style
- haml-mode
- hl-line+
- jedi
- js2-mode
- line-num
- lorem-ipsum
- magit
- markdown-mode
- matlab-mode
- php-mode
- pymacs
- python-mode
- redo+
- rst-mode
- ruby-mode
- smart-operator
- tidy
- virtualenvwrapper
- window-number
- yaml-mode
- yasnippet

It also contains two custom modes that I wrote:

- [asciidoc-mode](https://github.com/jmquigley/asciidoc-mode)
- [mmd-mode](https://github.com/jmquigley/mmd-mode) (multimarkdown mode, a derivative of markdown-mode)

To use this clone the repo and run the script `build.sh`.  This does **NOT** backup your current `.emacs` file in your home directory.  In my environment I don't modify these files directly so copying them over the top is desirable.
