(require 'openwith)

(if (string= system-type 'darwin)
    (setq openwith-associations '(("\\.pdf\\'" "open -a Skim" (file)))))

(openwith-mode t)

(provide 'openwith-settings)
