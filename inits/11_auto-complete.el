;;========================================
;; auto-complete
;;========================================
(use-package auto-complete
  :config
  (require 'auto-complete-config)
  (ac-config-default)
  (global-auto-complete-mode t)
  ;; C-n/C-pで候補選択
  (setq ac-use-menu-map t)
  (define-key ac-menu-map "\C-n" 'ac-next)
  (define-key ac-menu-map "\C-p" 'ac-previous))
