(require 'conda)

(use-package conda
    :ensure t
    :init
(progn
    ;; Point to your Miniconda installation directory
    (setq conda-anaconda-home (expand-file-name "/opt/conda"))
    (setq conda-env-home-directory (expand-file-name "/opt/conda/envs"))

    ;; Initialize and enable auto-activation
    (conda-env-initialize-interactive-shells)
    (conda-env-initialize-eshell)
    (conda-env-autoactivate-mode t)

    ;; (Optional) Display the active environment in the modeline
    (setq mode-line-format (cons '(:exec conda-env-current-name) mode-line-format))
))

(conda-env-activate "py3")

(provide 'conda-settings)
