(require 'cl) ;; これがないと何故かうまく動かない
;; ========================================
;; package.el
;; ========================================
(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; ;; Marmaladeを追加
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; 初期化
(package-initialize)

;; ========================================
;; setting
;; ========================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(Delete-auto-save-files t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
)
(setq desktop-globals-to-save '(extended-command-history))
(setq desktop-files-not-to-save "")
(desktop-save-mode 1)


;; 対応する括弧を強調
(show-paren-mode t)
;; 現在行をハイライト
(setq hl-line-face 'underline)
(global-hl-line-mode t)
;; 入力キー表示速度を早くする
(setq echo-keystrokes 0.1)
;; ;; C-h をバックスペースに。
(global-set-key "\C-h" 'backward-delete-char)
;; C-/をundoに
;(global-set-key "\C-/" 'undo)
;; 行末の空白を保存時に削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; ; タブ幅
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil) ; 空白でインデント
(defun indent-set ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 2 ) ; ブロック内のインデント数
  (setq tab-width 2 ) ; タブのインデント数
)
;; 文字コード
(set-language-environment "japanese")
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
;; ファイル名が重複した時に、バッファ名にディレクトリまで含める

(global-linum-mode t)        ; 行番号表示
(setq linum-format "%4d| ")  ; 行番号フォーマット

;;(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-buffer-name-style 'forward)
;; コマンド履歴の保存 http://qiita.com/akisute3@github/items/4b489c0abbb39a5dcc45
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

;;--------------------
;; タブ, 全角スペース, 行末空白表示
;;--------------------
;;---
(defface my-face-b-1 '((t (:background "NavajoWhite4"))) nil) ; 全角スペース
(defface my-face-b-2 '((t (:background "gray10"))) nil) ; タブ
(defface my-face-u-1 '((t (:background "SteelBlue" :underline t))) nil) ; 行末空白表示
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
 (font-lock-add-keywords major-mode '(("\t" 0 my-face-b-2 append)
 ("　" 0 my-face-b-1 append)
 ("[ \t]+$" 0 my-face-u-1 append)
 )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; mark-ring // enable to pop `mark-ring' repeatedly like C-u C-SPC C-SPC ...
(setq set-mark-command-repeat-pop t)
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
 '(default ((t (:foreground "white" :background "black"))))
 '(mode-line ((t (:foreground "white" :background "#0044cc" :box nil))))
 '(mode-line-inactive ((t (:foreground "white" :background "#262626" :box "nil")))))

;;========================================
;; helm
;;========================================
(global-set-key (kbd "C-x C-b") 'helm-mini)
(helm-mode 1)
;; M-yでキルリングの履歴一覧を表示
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
;; helm modeでもC-hで1文字削除
(define-key helm-map (kbd "C-h") 'delete-backward-char)
;; tabでディレクトリ移動
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; キーバインドの説明
(require 'helm-descbinds)
(helm-descbinds-mode)

;; find-file時 C-zでディレクトリ移動

;;========================================
;; auto-complete
;;========================================
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140322.321/dict")
(ac-config-default)
;; C-n/C-pで候補選択
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;;========================================
;; Emmet
;;========================================
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
(setq emmet-move-cursor-between-quotes t)


;;========================================
;; popwin
;;========================================
(require 'popwin)
(popwin-mode 1)

;;========================================
;; ruby-mode
;;========================================
(require 'ruby-block)
(require 'ruby-tools)

(defun ruby-mode-set-encoding () ())

;;========================================
;; rainbow-delimiters
;;========================================
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode t)
(custom-set-faces '(rainbow-delimiters-depth-1-face ((t (:foreground "#7f8c8d")))))

;;========================================
;; smartparens
;;========================================
(require 'smartparens-config)
(smartparens-global-mode t)

;;========================================
;; twittering-mode
;;========================================
(require 'twittering-mode)
(global-set-key "\C-ctw" 'twittering-mode)
;; OAuth認証を使う
(setq twittering-auth-method 'oauth)
(setq twittering-use-master-password)
;(load "~/.emacs.d/twitter_token")
(setq twittering-icon-mode t) ; アイコン表示 : 有効
(setq twittering-use-icon-storage t) ; アイコン保存 : 有効
(setq twittering-convert-fix-size 24) ; アイコンサイズ: 24px
(setq twittering-timer-interval 60) ; 更新間隔 : 60秒
;; タイムラインのフォーマット
(setq twittering-status-format
  "%i %s %@ %C{%y/%m/%d %H:%M}\n%t\n// from %f %RT{retweeted by %s}\n")
;; リツイートのフォーマット
(setq twittering-retweet-format " RT @%s: %t")
(defun twittering-mode-hook-func ()
  ;; ユーザ名とリンクを太字にする
  (set-face-bold-p 'twittering-username-face t)
  ;; ユーザー名とリンクの色
  (set-face-foreground 'twittering-username-face "DeepSkyBlue3")
  ;; URLとタイムスタンプの色
  (set-face-foreground 'twittering-uri-face "gray60")
  ;; Shift+f でお気に入り登録
  (define-key twittering-mode-map (kbd "F") 'twittering-favorite))
(add-hook 'twittering-mode-hook 'twittering-mode-hook-func)
;; 行番号表示を無効にする
(defadvice linum-on (around for-twit activate)
  (unless (memq major-mode '(twittering-mode twittering-edit-mode)) ad-do-it))

;;========================================
;; git-gutter
;;========================================

(global-git-gutter-mode t)
(set-face-background 'git-gutter:modified "purple")
(set-face-foreground 'git-gutter:added    "green")
(set-face-foreground 'git-gutter:deleted  "red")

;;========================================
;; anzu
;;========================================

(global-anzu-mode t)
(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactive-region t)
 '(anzu-search-threshold 1000))

;;========================================
;; volatile-highlights
;;========================================

(require 'volatile-highlights)
(volatile-highlights-mode t)

;;========================================
;; oniisama
;; https://github.com/yu-i9/oniisama
;;========================================

(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'oniisama)

;;========================================
;; ace-isearch
;;========================================

(global-ace-isearch-mode 1)

;;========================================
;; java
;;========================================
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2)))
