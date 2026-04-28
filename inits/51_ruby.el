;;========================================
;; ruby-mode
;;========================================
(use-package ruby-tools)
(use-package projectile-rails
  :config
  (projectile-rails-global-mode t))

(defun ruby-mode-set-encoding () ())
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;; this is for ruby mode
(setq ruby-insert-encoding-magic-comment nil)

;;========================================
;; rspec-mode
;;========================================

(use-package rspec-mode
  :config
  (eval-after-load 'rspec-mode
    '(rspec-install-snippets)))

;;========================================
;; minitest-mode
;;========================================

(use-package minitest
  :config
  (add-hook 'ruby-mode-hook 'minitest-mode)
  (eval-after-load 'minitest
    '(minitest-install-snippets)))
