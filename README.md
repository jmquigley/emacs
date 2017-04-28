Emacs
=====
My Emacs configuration.  This is a reorganization of my current setup.  It was inspired by [jhamrick's layout](https://github.com/jhamrick/emacs).  It has a nice, organized layout.  This setup also uses [el-get](https://github.com/dimitri/el-get) to manage the packages and their dependencies.  The environment must be configured to use this tool.  The following tools must be installed in your environment.  This now assumes that one is using OSX with [homebrew](http://brew.sh/) installed.

- `brew install emacs --with-cocoa --with-gnutls`
- `brew install autoconf`
- `brew install git`
- `brew install subversion`
- `brew install hg`
- `brew install bz`
- `brew install cvs`

If using Linux, then the following packages would be required:

- build-essential
- autoconf
- [texinfo](http://www.gnu.org/software/texinfo/)
- [git](http://git-scm.com/)
- [subversion](https://subversion.apache.org/)
- [hg (Mercurial SCM)](http://mercurial.selenic.com/)
- [bz (Bazaar SCM)](http://bazaar.canonical.com/en/)
- [cvs](http://en.wikipedia.org/wiki/Concurrent_Versions_System)

All of these source control tools are needed because different emacs packages require different tools to download their libraries through el-get.

This setup uses the following Emacs packages:

- [auto-complete](http://www.emacswiki.org/emacs/AutoComplete)
- [autopair](http://www.emacswiki.org/emacs/AutoPairs)
- [bookmark+](http://www.emacswiki.org/BookmarkPlus)
- [centered-cursor-mode](http://www.emacswiki.org/emacs/centered-cursor-mode.el)
- [cmake-mode](https://cmake.org/Wiki/CMake/Editors/Emacs)
- [color-theme-solarized](https://github.com/sellout/emacs-color-theme-solarized)
- [dictionary](https://github.com/myrkr/dictionary-el)
- [el-get](https://github.com/dimitri/el-get)
- [expand-region](https://github.com/magnars/expand-region.el)
- [flycheck](https://flycheck.readthedocs.org/en/latest/)
- [git-blamed](https://melpa.org/#/git-blamed)
- [ggtags](https://github.com/leoliu/ggtags)
- [google-c-style](https://google-styleguide.googlecode.com/svn/trunk/google-c-style.el)
- [haml-mode](https://github.com/nex3/haml-mode)
- [hl-line+](http://www.emacswiki.org/hl-line+.el)
- [jedi](http://tkf.github.io/emacs-jedi/latest/)
- [js2-mode](http://www.emacswiki.org/Js2Mode)
- [line-num](http://www.emacswiki.org/LineNumbers)
- [lorem-ipsum](http://www.emacswiki.org/emacs/lorem-ipsum.el)
- [magit](http://magit.github.io/)
- [markdown-mode](http://jblevins.org/projects/markdown-mode/)
- [move-text](http://www.emacswiki.org/emacs/move-text.el)
- [php-mode](http://www.emacswiki.org/PhpMode)
- [pymacs](https://github.com/pinard/Pymacs)
- [python-mode](https://launchpad.net/python-mode)
- [redo+](http://www.emacswiki.org/RedoPlus)
- [rst-mode](http://docutils.sourceforge.net/docs/user/emacs.html)
- ruby-mode
- [smart-operator](http://xwl.appspot.com/ref/smart-operator.el)
- [smooth-scrolling](http://www.emacswiki.org/emacs/SmoothScrolling)
- [tidy](http://www.emacswiki.org/emacs/tidy.el)
- [virtualenvwrapper](https://bitbucket.org/dhellmann/virtualenvwrapper/)
- [window-number](http://www.emacswiki.org/NumberedWindows)
- [yaml-mode](http://www.emacswiki.org/YamlMode)
- [yasnippet](https://github.com/capitaomorte/yasnippet)

It also contains two custom modes that I wrote:

- [asciidoc-mode](https://github.com/jmquigley/asciidoc-mode)
- [mmd-mode](https://github.com/jmquigley/mmd-mode) (multimarkdown mode, a derivative of markdown-mode)

To use this clone the repo and run the script `build.sh`.  This does **NOT** backup your current `.emacs` file in your home directory.  In my environment I don't modify these files directly so copying them over the top is desirable.
