(eval-when-compile
  (require 'init-custom))

;; smartparens
(use-package smartparens
  :config
  (setq sp-base-key-bindings 'paredit
        sp-highlight-pair-overlay nil
        smartparens-global-mode t
        show-smartparens-global-mode t)
  (sp-use-paredit-bindings))

(provide 'init-misc)
