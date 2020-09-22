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
 '(mode-line ((t (:foreground "white" :background "#000000" :box nil))))
 '(mode-line-inactive ((t (:foreground "white" :box "nil"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#7f8c8d")))))

;; color-theme
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-molokai)

;; modeline
(setq-default mode-line-format
  (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize "%b " 'face 'font-lock-keyword-face
        'help-echo (buffer-file-name)))

    ;; line and column
    "(" ;; '%02' to set to 2 chars at least; prevents flickering
      (propertize "%03l" 'face 'font-lock-type-face) ","
      (propertize "%03c" 'face 'font-lock-type-face)
    ") "

    ;; relative position, size of file
    "["
    ;; (propertize "%06p" 'face 'font-lock-constant-face) ;; % above top
    ;; "/"
    (propertize "%I" 'face 'font-lock-constant-face) ;; size
    "] "

    ;; the current major mode for the buffer.
    "["

    '(:eval (propertize "%m" 'face 'font-lock-string-face
              'help-echo buffer-file-coding-system))
    "] "

    "[" ;; insert vs overwrite mode, input-method in a tooltip
    '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
              'face 'font-lock-preprocessor-face
              'help-echo (concat "Buffer is in "
                           (if overwrite-mode "overwrite" "insert") " mode")))

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat ","  (propertize "Mod"
                             'face 'font-lock-warning-face
                             'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
              (concat ","  (propertize "RO"
                             'face 'font-lock-type-face
                             'help-echo "Buffer is read-only"))))
    "] "
    ;; add the time, with the date and the emacs uptime in the tooltip
    ;; I don't want to see minor-modes; but if you want, uncomment this:
    ;; minor-mode-alist  ;; list of minor modes
    "%-" ;; fill with '-'
    ))

(add-hook 'tty-setup-hook
          '(lambda ()
             (set-terminal-parameter nil 'background-mode 'dark)))

;;========================================
;; anzu
;;========================================

(global-anzu-mode t)

;;========================================
;; beacon
;;========================================
(setq beacon-color "color-129")
(setq beacon-blink-duration 0.1)
(setq beacon-blink-delay 0.1)
(beacon-mode t)

;;========================================
;; highright indent guide
;;========================================

(require 'highlight-indent-guides)
(setq highlight-indent-guides-method 'fill)
(set-face-background 'highlight-indent-guides-odd-face "color-234")
(set-face-background 'highlight-indent-guides-even-face "color-235")

(add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)
(add-hook 'python-mode-hook 'highlight-indent-guides-mode)

;;========================================
;; volatile-highlights
;;========================================

(require 'volatile-highlights)
(volatile-highlights-mode t)

;;========================================
;; rainbow-delimiters
;;========================================

(require 'cl-lib)
(require 'color)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(cl-loop
 for index from 1 to rainbow-delimiters-max-face-count
 do
 (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
   (cl-callf color-saturate-name (face-foreground face) 30)))

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
