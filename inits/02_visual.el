;; 見た目の設定

;;--------------------
;; ウィンドウ移動
;;--------------------
;; 反対側のｳｨﾝﾄﾞｳにいけるように
(setq windmove-wrap-around t)
;; C-M-{p,n,f,b}でｳｨﾝﾄﾞｳ間を移動
(define-key global-map (kbd "C-M-p") 'windmove-up)
(define-key global-map (kbd "C-M-n") 'windmove-down)
(define-key global-map (kbd "C-M-f") 'windmove-right)
(define-key global-map (kbd "C-M-b") 'windmove-left)
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 1))) ; ctrl押しっぱなしでも移動可能
(global-set-key (kbd "C-x C-n") (lambda () (interactive) (other-window 1))) ; ctrl押しっぱなしでも移動可能
(global-set-key (kbd "C-x C-p") (lambda () (interactive) (other-window -1))) ; 逆方向の移動

;;--------------------
;; 色設定
;;--------------------

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "white" :background "#0044cc" :box nil))))
 '(mode-line-inactive ((t (:foreground "white" :background "#262626" :box "nil"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#7f8c8d")))))

;;========================================
;; anzu
;;========================================

(global-anzu-mode t)

;;========================================
;; volatile-highlights
;;========================================

(require 'volatile-highlights)
(volatile-highlights-mode t)

;;========================================
;; rainbow-delimiters
;;========================================

(require 'rainbow-delimiters)
(rainbow-delimiters-mode t)

;;========================================
;; rainbow-mode
;;========================================

(setq rainbow-html-colors t)
(setq rainbow-x-colors t)
(setq rainbow-latex-colors t)
(setq rainbow-ansi-colors t)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'php-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)

;;========================================
;; smartparens
;;========================================

(require 'smartparens-config)
(smartparens-global-mode t)
