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
  :load-path (lambda () (expand-file-name "copilot.el" user-emacs-directory))
  ;; don't show in mode line
  :diminish
  :init
  (setq copilot-indent-offset-warning-disable t)
  :hook
  (prog-mode . copilot-mode)
  )

(provide 'init-copilot)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-copilot.el ends
