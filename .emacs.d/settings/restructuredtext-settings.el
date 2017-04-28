(require 'rst)

(add-hook 'rst-mode-hook '(lambda()
    (minor-mode-hooks)
))
(eval-after-load "rst"
  '(progn
     (define-key rst-mode-map (kbd "<M-RET>")
       (lambda ()
         (interactive)
         (rst-insert-list)))))

(provide 'restructuredtext-settings)