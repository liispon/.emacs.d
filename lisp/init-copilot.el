;; init-go.el --- Initialize copilot configurations.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; copilot configurations.
;;

;;; Code:

(eval-when-compile
  (require 'init-custom))

;; copilot
(use-package copilot
  ;; :vc (:url "https://github.com/copilot-emacs/copilot.el"
  ;;           :rev :newest
  ;;           :branch "main")
  ;;   ;; don't show in mode line
  :diminish
  :init
  (setq copilot-indent-offset-warning-disable t)
  ;; Define the custom function that either accepts the completion or does the default behavior
  (defun my/copilot-tab-or-default ()
    (interactive)
    (let ((prev-tab-func (key-binding (kbd "TAB"))))
      (if (and (bound-and-true-p copilot-mode)
               ;; Add any other conditions to check for active copilot suggestions if necessary
               )
          (copilot-accept-completion)
        (prev-tab-func)))) ; Default action to insert a tab. Adjust as needed.

  :hook
  (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
         ("<tab>" . 'my/copilot-tab-or-default)
         ("TAB" . 'my/copilot-tab-or-default))
  ;; :bind (:map copilot-completion-map
  ;;        ("<tab>" . 'copilot-accept-completion)
  ;;        ("TAB" . 'copilot-accept-completion)
  ;;        ("C-TAB" . 'copilot-accept-completion-by-word)
  ;;        ("C-<tab>" . 'copilot-accept-completion-by-word))
  :config
  ;; (setq copilot-completion-method 'ivy)
  ;; (setq copilot-completion-method 'helm)
  ;; (setq copilot-completion-method 'company)
  (if url-proxy-services
      (prog
       (let* (parts (centaur-proxy))
         (setq copilot-proxy-host (car parts))
         (setq copilot-proxy-port (cdr parts)))
       (setq copilot-network-proxy '(:host 'copilot-proxy-host :port 'copilot-proxy-port))
       )))

(provide 'init-copilot)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-copilot.el ends
