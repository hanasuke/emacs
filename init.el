;; caskの初期化


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'auto-mode-alist '("Cask$" . emacs-lisp-mode))
;; system-typeによってCaskの呼出し先を変更
(cond ((eq system-type 'gnu/linux)
       (require 'cask "~/.cask/cask.el") ;; linuxのとき
       )
      ((eq system-type 'darwin)
       (require 'cask)))  ;; macOSのとき
(cask-initialize)

;; init-loaderの呼び出し

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits/")

;;========================================
;; Tramp
;;========================================

(require 'tramp)
(setq tramp-default-method "ssh")

;;========================================
;; Git-gutter
;;========================================

(global-git-gutter-mode t)
(set-face-background 'git-gutter:modified "purple")
(set-face-foreground 'git-gutter:added    "green")
(set-face-foreground 'git-gutter:deleted  "red")


;;========================================
;; ace-isearch
;;========================================

(global-ace-isearch-mode 1)
