(require 'magit)
(setq magit-repo-dirs `(,(concat root.dir "workspace/environment")
                        ,(concat root.dir "workspace/emacs")
                        ,(concat root.dir "workspace/mycoredump")
                        ,(concat root.dir "workspace/scriblet")
                        ,(concat root.dir "workspace/geeknote")
                        ,(concat root.dir "Dropbox/Documents/notebook")))
(setq magit-repo-dirs-depth 2)
(autoload 'magit-status "magit" nil t)

(provide 'magit-settings)
