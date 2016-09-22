(require 'cl) ;; これがないと何故かうまく動かない
;; ========================================
;; package.el
;; ========================================
(require 'package)
;; color-theme
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-molokai)
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
 '(Delete-auto-save-files t)
 '(anzu-deactive-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(global-wakatime-mode t)
 '(google-translate-default-source-language "ja")
 '(google-translate-default-target-language "en")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(wakatime-api-key "c6bf16e1-01c2-40c6-8e2b-cf212cdc3bef"))

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

;; comment or uncomment region
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)

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
 '(mode-line ((t (:foreground "white" :background "#0044cc" :box nil))))
 '(mode-line-inactive ((t (:foreground "white" :background "#262626" :box "nil"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#7f8c8d")))))

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
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;;----------------------------------------
;; projectile-rails
;;----------------------------------------

(require 'projectile)
(projectile-global-mode)

(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;;========================================
;; rainbow-delimiters
;;========================================
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode t)


;;========================================
;; smartparens
;;========================================
(require 'smartparens-config)
(smartparens-global-mode t)

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


;;========================================
;; volatile-highlights
;;========================================

(require 'volatile-highlights)
(volatile-highlights-mode t)

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

;;========================================
;; golang
;;========================================

(require 'go-mode-autoloads)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-to-list 'exec-path (expand-file-name "/usr/local/go/bin"))
(add-to-list 'exec-path (expand-file-name "~/lib/go/bin"))
(add-hook 'go-mode-hook (lambda()
                          (local-set-key (kbd "M-.") 'godef-jump)))
(add-hook 'go-mode-hook
          '(lambda()
             (setq tab-width 2)
             (setq indent-tabs-mode nil)
             ))
; go autocomplete-mode
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;;========================================
;; C/C++
;;========================================

(add-hook 'c-mode-common-hook 'google-set-c-style)

;;========================================
;; Google translte
;;========================================

(require 'google-translate)

(global-set-key "\C-xt" 'google-translate-at-point)
(global-set-key "\C-xT" 'google-translate-query-translate)



(push '("*Google Translate*") popwin:special-display-config)

;;========================================
;; wakatime
;;========================================

(global-wakatime-mode t)

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
