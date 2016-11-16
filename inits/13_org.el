;;========================================
;; org mode
;;========================================

; 画面端折り返し
(setq org-startup-truncated nil)
(defun change-truncation()
  (interactive)
  (cond ((eq truncate-lines nil)
         (setq truncate-lines t))
        (t
                  (setq truncate-lines nil))))
