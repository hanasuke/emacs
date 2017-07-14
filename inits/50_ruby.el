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
