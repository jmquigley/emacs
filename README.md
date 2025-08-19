Emacs
=====
My Emacs configuration.  This is a reorganization of my current setup.  This setup uses the built in [package](https://www.emacswiki.org/emacs/InstallingPackages) facility.


Requirements
------------
Emacs 29.x+
Linux, OSX, or Windows

This repo no longer works with versions of Emacs <27.  It can be made to work with it if the devdocs package is excluded.


Installation
------------
To use this clone the repo and run the script `./install.sh` in a Linux or OSX environment.  To use in a Windows environment run the script `install.cmd` (with powershell).  This does **NOT** backup your current `.emacs.d` directory in your home directory; it performs a fresh install.  When Emacs starts for the first time on a fresh install there will be a delay (it will look like the app is frozen).  The initial install of the packages takes some time to download and install.


Packages
--------

- [auctex](https://elpa.gnu.org/packages/auctex.html)
- [citre](https://melpa.org/#/citre)
- [clang-format](https://melpa.org/#/clang-format)
- [cmake-mode](https://melpa.org/#/cmake-mode)
- [company](https://melpa.org/#/company)
- [company-jedi](https://melpa.org/#/company-jedi)
- [dash](https://melpa.org/#/dash)
- [devdocs](https://melpa.org/#/devdocs)
- [dictionary](https://melpa.org/#/dictionary)
- [dockerfile-mode](https://melpa.org/#/dockerfile-mode)
- [elpy](https://melpa.org/#/elpy)
- [expand-region](https://melpa.org/#/expand-region)
- [fill-column-indicator](https://melpa.org/#/fill-column-indicator)
- [flycheck](https://melpa.org/#/flycheck)
- [git-blamed](https://melpa.org/#/git-blamed)
- [go-mode](https://melpa.org/#/go-mode)
- [google-c-style](https://melpa.org/#/google-c-style)
- [gptel](https://melpa.org/#/gptel)
- [groovy-mode](https://melpa.org/#/groovy-mode)
- [haml-mode](https://melpa.org/#/haml-mode)
- [jedi-core](https://melpa.org/#/jedi-core)
- [js2-mode](https://melpa.org/#/js2-mode)
- [json-mode](https://melpa.org/#/json-mode)
- [lorem-ipsum](https://melpa.org/#/lorem-ipsum)
- [lsp-docker](https://melpa.org/#/lsp-docker)
- [lsp-java](https://melpa.org/#/lsp-java)
- [lsp-jedi](https://melpa.org/#/lsp-jedi)
- [magit](https://melpa.org/#/magit)
- [markdown-mode](https://melpa.org/#/markdown-mode)
- [move-text](https://melpa.org/#/move-text)
- [openwith](https://melpa.org/#/openwith)
- [php-mode](https://melpa.org/#/php-mode)
- [powershell](https://melpa.org/#/powershell)
- [prettier-js](https://melpa.org/#/prettier-js)
- [projectile](https://melpa.org/#/projectile)
- [rainbow-delimiters](https://melpa.org/#/rainbow-delimiters)
- [realgud](https://github.com/realgud/realgud)
  [revert-buffer-all](https://melpa.org/#/revert-buffer-all)
- [s](https://melpa.org/#/s)
- [slime](https://melpa.org/#/slime)
- [typescript-mode](https://melpa.org/#/typescript-mode)
- [undo-tree](https://melpa.org/#/undo-tree)
- [virtualenvwrapper](https://melpa.org/#/virtualenvwrapper)
- [web-mode](https://melpa.org/#/web-mode)
- [window-number](http://www.emacswiki.org/NumberedWindows)
- [ws-butler](https://melpa.org/#/ws-butler)
- [yaml-mode](https://melpa.org/#/yaml-mode)
- [yasnippet](https://melpa.org/#/yasnippet)
- [yasnippet-snippets](https://github.com/AndreaCrotti/yasnippet-snippets)

It also contains two custom modes that I wrote:

- [asciidoc-mode](https://github.com/jmquigley/asciidoc-mode)
- [mmd-mode](https://github.com/jmquigley/mmd-mode) (multimarkdown mode, a derivative of markdown-mode)

LSP Server Modes
----------------
