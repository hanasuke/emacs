(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(add-to-list 'auto-mode-alist '("Cask$" . emacs-lisp-mode))
(setq warning-suppress-log-types '((package reinitialization)))
(setq byte-compile-warnings '(cl-functions))
;; system-typeによってCaskの呼出し先を変更
(cond ((eq system-type 'gnu/linux)
       (require 'cask "~/.cask/cask.el") ;; linuxのとき
       )
      ((eq system-type 'darwin)
       (require 'cask)))  ;; macOSのとき
(cask--initialize)

;; init-loaderの呼び出し

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits/")

;; call line-number
(if (version<= "26.0.50" emacs-version)
    (global-display-line-numbers-mode "relative")
  (global-linum-mode t))

;;========================================
;; Tramp
;;========================================

(require 'tramp)
(setq tramp-default-method "ssh")

;;========================================
;; Git-gutter
;;========================================

(global-git-gutter-mode t)
(set-face-foreground 'git-gutter:added    "green")
(set-face-foreground 'git-gutter:deleted  "red")

(unless (version<= "26.0.50" emacs-version)
    (git-gutter:linum-setup))

;;========================================
;; ace-isearch
;;========================================

(global-ace-isearch-mode 1)
