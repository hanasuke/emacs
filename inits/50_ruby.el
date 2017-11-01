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

(projectile-rails-global-mode t)

;;========================================
;; rspec-mode
;;========================================

(require 'rspec-mode)

(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

;;========================================
;; minitest-mode
;;========================================

(require 'minitest-mode)

(add-hook 'ruby-mode-hook 'minitest-mode)
(eval-after-load 'minitest
  '(minitest-install-snippets))
