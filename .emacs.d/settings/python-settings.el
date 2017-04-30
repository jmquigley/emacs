(require 'python-environment)
(require 'jedi)

; (elpy-enable)

(setq-default indent-tabs-mode nil)

(when (featurep 'python) (unload-feature 'python t))
(setq-default py-indent-offset 4)
(setq-default py-start-run-py-shell t)

(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-hook 'python-mode-hook '(lambda()
    (message "Loading python mode customizations")
    (development-minor-mode-hooks)
    (auto-complete-mode 0)
    (define-key python-mode-map (kbd "\C-c \\") 'py-indent-region)
    (define-key python-mode-map (kbd "\C-j") 'join-line)
))

; ;; Overrides the location of the PDB debugger
; (setq pdb-path '/usr/lib/python3.4/pdb.py
;       gud-pdb-command-name (symbol-name pdb-path))
; (defadvice pdb (before gud-query-cmdline activate)
;   "Provide a better default command line when called interactively."
;   (interactive
;    (list (gud-query-cmdline pdb-path
;                                 (file-name-nondirectory buffer-file-name)))))

(provide 'python-settings)
