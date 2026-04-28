(use-package python-mode
  :mode "\\.py\\'"
  :interpreter "python"
  :hook ((python-mode . eglot-ensure)
         (python-mode . (lambda ()
                         (add-hook 'before-save-hook
                                   'eglot-format-buffer nil t)))
         (python-mode . (lambda ()
                         (add-hook 'before-save-hook
                                   'py-isort-buffer nil t)))))

(use-package py-isort)
