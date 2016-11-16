;; popwin

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)

;;========================================
;; Google translte
;;========================================

(require 'google-translate)

(global-set-key "\C-xt" 'google-translate-at-point)
(global-set-key "\C-xT" 'google-translate-query-translate)

(push '("*Google Translate*") popwin:special-display-config)
