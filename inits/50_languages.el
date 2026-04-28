;; use language server

;; dependencies update
(use-package eldoc)
(use-package jsonrpc)

(use-package eglot)

(use-package git-modes
  :config
  (add-to-list 'auto-mode-alist
               (cons "/.dockerignore\\'" 'gitignore-mode)))
