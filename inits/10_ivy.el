(use-package ivy
  :demand t
  :config
  ;; `ivy-switch-buffer' (C-x b) のリストに recent files と bookmark を含める．
  (setq ivy-use-virtual-buffers t)

  ;; ミニバッファでコマンド発行を認める
  (setq enable-recursive-minibuffers t)
  (minibuffer-depth-indicate-mode 1) ;; 何回層入ったかプロンプトに表示．

  ;; ESC連打でミニバッファを閉じる
  (define-key ivy-minibuffer-map (kbd "<escape>") 'minibuffer-keyboard-quit)

  ;; プロンプトの表示が長い時に折り返す（選択候補も折り返される）
  (setq ivy-truncate-lines nil)

  ;; リスト先頭で `C-p' するとき，リストの最後に移動する
  (setq ivy-wrap t)

  (ivy-mode 1))

(use-package counsel
  :demand t
  :bind (("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop)
         ("C-M-z" . counsel-fzf)
         ("C-M-r" . counsel-recentf)
         ("C-x C-b" . counsel-ibuffer)
         ("C-M-f" . counsel-ag))
  :config
  (counsel-mode 1))

(use-package swiper)
