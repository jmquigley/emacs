(require 'whitespace)

(setq whitespace-line-column 120)

(setq whitespace-display-mappings '(
    (space-mark   ?\     [?\u00B7]     [?.])
    (space-mark   ?\xA0  [?\u00A4]     [?_])
    (newline-mark ?\n    [?\u00B6 ?\n])
    (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t])
))

(provide 'whitespace-settings)
