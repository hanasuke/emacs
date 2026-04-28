;; popwin

;; (require 'popwin)
;; (setq display-buffer-function 'popwin:display-buffer)
;; (setq popwin:popup-window-position 'bottom)

;;========================================
;; Google translte
;;========================================

(use-package google-translate
  :bind (("C-x t" . google-translate-at-point)
         ("C-x T" . google-translate-query-translate)))
