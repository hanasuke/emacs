;;========================================
;; web-mode
;;========================================

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq tab-width 2)
  )
(add-hook 'web-mode-hook 'web-mode-hook)
