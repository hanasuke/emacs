;;========================================
;; golang
;;========================================

(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-to-list 'exec-path (expand-file-name "/usr/local/go/bin"))
(add-to-list 'exec-path (expand-file-name "~/lib/go/bin"))

;; keybind
(add-hook 'go-mode-hook
          '(lambda()
             (local-set-key (kbd "M-.") 'godef-jump)
             (define-key go-mode-map "\C-c." 'go-test-current-file)
             (define-key go-mode-map "\C-cf" 'go-test-current-test)
             (define-key go-mode-map "\C-c\C-n" 'go-run)))

(add-hook 'go-mode-hook
          '(lambda()
             (setq tab-width 2)
             (setq indent-tabs-mode nil)))

; go autocomplete-mode
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
