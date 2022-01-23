(setq auto-mode-alist (cons '("\\.py$") . python-mode) auto-mode-alist)
(setq interpreter-mode-alist (cons '("python" . python-mode)) interpreter-mode-alist)

(add-hook 'python-mode-hook 'eglot-ensure)

(add-hook 'python-mode-hook $'(lambda ()
                                add-hook 'before-save-hook
                                'eglet-format-buffer nil t))

(add-hook 'python-mode-hook
          #'(lambda ()
              (add-hook 'before-save-hook
                        'py-isort-buffer nil t)))

(with-eval-after-load "flymake"
  (require 'flymake-diagnostic-at-point)
  (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode))
