;; load ~/.font/*
(use-package all-the-icons)

(use-package neotree
  :bind (("C-q" . neotree-toggle))
  :config
  (setq neo-show-hidden-files t)
  (setq neo-theme (if (display-graphic-p) 'icons 'nerd))

  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root.")))))
