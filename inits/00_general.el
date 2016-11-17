;; 変数定義
(custom-set-variables
 '(delete-auto-save-files t)
 '(auto-save-default nil)
 '(anzu-deactive-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(google-translate-default-source-language "ja")
 '(google-translate-default-target-language "en")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

;; 対応する括弧を強調
(show-paren-mode t)

;; 現在行をハイライト
(setq hl-line-face 'underline)
(global-hl-line-mode t)

;; 入力キー表示速度を早くする
(setq echo-keystrokes 0.1)
;; ;; C-h をバックスペースに。
(global-set-key "\C-h" 'backward-delete-char)

;; 文字コード
(set-language-environment "japanese")
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

(global-linum-mode t)        ; 行番号表示
(setq linum-format "%4d| ")  ; 行番号フォーマット

(setq uniquify-buffer-name-style 'forward)
;; コマンド履歴の保存
(setq desktop-globals-to-save '(extended-command-history))
(setq desktop-files-not-to-save "")
(desktop-save-mode 1)

;; yes, no をy, nに
(fset 'yes-or-no-p 'y-or-n-p)
(define-key query-replace-map [return] 'act)

;; aspell
(setq-default ispell-program-name "aspell")
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
(global-set-key (kbd "C-M-$") 'ispell-compre)

;; comment or uncomment region
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)


;;========================================
;; wakatime
;;========================================

(global-wakatime-mode t)
