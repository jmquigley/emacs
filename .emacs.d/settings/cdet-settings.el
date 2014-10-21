(require 'epc)
(require 'semantic)
(require 'srecode)

(semantic-mode t)
(global-ede-mode t)
(global-semanticdb-minor-mode t)
(global-srecode-minor-mode t)
(ede-enable-generic-projects)
(global-semantic-idle-summary-mode t)

(provide 'cdet-settings)