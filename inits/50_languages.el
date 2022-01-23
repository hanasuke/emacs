;; use language server
(require 'eglet)

(add-to-list 'auto-mode-alist
             (cons "/.dockerignore\\'" 'gitignore-mode))
