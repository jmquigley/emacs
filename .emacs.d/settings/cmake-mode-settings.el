(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("CMakeLists\\.requirements\\.txt\\'" . cmake-mode))
       '(("CMakeLists\\.testing\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))

(defun base-cmake-hook ()
"Common code for all cmake initializations"
    (development-minor-mode-hooks)
    (display-line-numbers-mode)
)

(add-hook 'cmake-mode-hook #'(lambda()
    (base-cmake-hook)
))

(provide 'cmake-mode-settings)
