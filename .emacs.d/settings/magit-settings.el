(require 'magit)
(setq magit-repo-dirs `(,(concat root.dir "workspace/emacs")
                        ,(concat root.dir "workspace/geeknote")
                        ,(concat root.dir "Google/Notebook")))
(setq magit-repo-dirs-depth 2)
(autoload 'magit-status "magit" nil t)

(provide 'magit-settings)
