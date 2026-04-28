(setq package-enable-at-startup nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq warning-suppress-log-types '((package reinitialization) (emacs)))
(setq byte-compile-warnings '(cl-functions))

;; setup elpaca
(defvar elpaca-installer-version 0.12)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; initial packages
(elpaca elpaca-use-package
   (elpaca-use-package-mode)
   (setq elpaca-use-package-by-default t))

(elpaca-wait)

(setq use-package-always-defer t)
(setq use-package-verbose t)

;;========================================
;; Declare all packages used in inits/ files
;;========================================

(use-package init-loader :ensure (:wait t) :demand t)

;; These packages need to be installed before init-loader runs
(use-package ace-jump-mode :ensure (:wait t) :demand t)
(use-package ace-isearch :ensure (:wait t) :demand t)
(use-package git-gutter :ensure (:wait t) :demand t)
(use-package ivy :ensure (:wait t) :demand t)
(use-package counsel :ensure (:wait t) :demand t)
(use-package swiper :ensure (:wait t) :demand t)
(use-package anzu :ensure (:wait t) :demand t)
(use-package highlight-indent-guides :ensure (:wait t) :demand t)
(use-package volatile-highlights :ensure (:wait t) :demand t)
(use-package rainbow-delimiters :ensure (:wait t) :demand t)
(use-package smartparens :ensure (:wait t) :demand t)
(use-package google-translate :ensure (:wait t) :demand t)
(use-package neotree :ensure (:wait t) :demand t)
(use-package all-the-icons :ensure (:wait t) :demand t)
(use-package auto-complete :ensure (:wait t) :demand t)
(use-package emmet-mode :ensure (:wait t) :demand t)
(use-package jsonrpc :ensure (:wait t) :demand t)
(use-package git-modes :ensure (:wait t) :demand t)
(use-package ruby-tools :ensure (:wait t) :demand t)
(use-package projectile-rails :ensure (:wait t) :demand t)
(use-package rspec-mode :ensure (:wait t) :demand t)
(use-package minitest :ensure (:wait t) :demand t)
(use-package go-mode :ensure (:wait t) :demand t)
(use-package go-autocomplete :ensure (:wait t) :demand t)
(use-package google-c-style :ensure (:wait t) :demand t)
(use-package web-mode :ensure (:wait t) :demand t)
(use-package python-mode :ensure (:wait t) :demand t)
(use-package py-isort :ensure (:wait t) :demand t)
(use-package direnv :ensure (:wait t) :demand t)
(use-package yasnippet :ensure (:wait t) :demand t)

;; Wait for all packages to be installed
(elpaca-wait)

;;========================================
;; Git-gutter configuration
;;========================================

(when (require 'git-gutter nil t)
  (global-git-gutter-mode t)
  (set-face-foreground 'git-gutter:added    "green")
  (set-face-foreground 'git-gutter:deleted  "red")
  (unless (version<= "26.0.50" emacs-version)
    (git-gutter:linum-setup)))

;;========================================
;; init-loader
;;========================================

;; Load init files after all packages are ready
(when (require 'init-loader nil t)
  (setq init-loader-show-log-after-init nil)
  (init-loader-load "~/.emacs.d/inits/"))

;; call line-number
(if (version<= "26.0.50" emacs-version)
    (global-display-line-numbers-mode "relative")
  (global-linum-mode t))

;;========================================
;; Tramp
;;========================================

(when (require 'tramp nil t)
  (setq tramp-default-method "ssh"))

;;========================================
;; ace-isearch
;;========================================

(when (require 'ace-isearch nil t)
  (global-ace-isearch-mode t))
