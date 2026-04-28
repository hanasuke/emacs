;;========================================
;; web-mode
;;========================================

(use-package web-mode
  :mode "\\.jsx\\'"
  :config
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq tab-width 2))
  (add-hook 'web-mode-hook 'my-web-mode-hook))
