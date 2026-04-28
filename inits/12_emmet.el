;;========================================
;; Emmet
;;========================================
(use-package emmet-mode
  :hook ((sgml-mode . emmet-mode)
         (css-mode . emmet-mode)
         (emmet-mode . (lambda () (setq emmet-indentation 2))))
  :config
  (setq emmet-move-cursor-between-quotes t))
