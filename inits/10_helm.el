;;========================================
;; helm
;;========================================
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; M-yでキルリングの履歴一覧を表示
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
;; helm modeでもC-hで1文字削除
(define-key helm-map (kbd "C-h") 'delete-backward-char)
;; tabでディレクトリ移動
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; キーバインドの説明
(require 'helm-descbinds)
(helm-descbinds-mode)

;; find-file時 C-zでディレクトリ移動
