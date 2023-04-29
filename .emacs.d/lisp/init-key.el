;; replaces forward-sentence
;; ** Global Keybindings
(require 'init-fun)
(require 'advance-words-count)
(use-package general)

(global-unset-key (kbd "C-o"))
(global-unset-key (kbd "C-s-p"))
(general-define-key
 "C-c k" 'kill-this-buffer
 "C-q" 'read-only-mode
 "C-c e" 'eval-buffer
 "C-c t" 'vterm-other-window
 "C-c <f5>" 'treemacs
 "C-c M-r" 'sp-wrap-round
 "C-c M-c" 'sp-wrap-curly
 "C-c RET" 'yas-expand
 "<f5>" 'treemacs
 "C-c u" 'sp-unwrap-sexp
 "M-n" 'good-scroll-up
 "M-p" 'good-scroll-down
 "C-c l i" 'lsp-ui-imenu
 "M-g j" 'dumb-jump-hydra/body
 "C-v" 'my-scroll-up
 "M-v" 'my-scroll-down
 "C-M-v" 'my-scroll-other-window-up
 "C-S-M-v" 'my-scroll-other-window-down
 "M-m" 'set-mark-command
 "C-]" 'add-curly
 "C-c f" 'find-in-ssd
 "C-x <right>" 'my-next-buffer
 "C-x <left>" 'my-previous-buffer
 "M-j" 'avy-goto-char-2
 "M-g g" 'avy-goto-line
 "M-g w" 'avy-goto-word-1
 "C-e" 'select-line-to-the-end
 "C-a" 'select-line-to-the-start
 "C-o" 'insert-line-above
 )

(global-unset-key (kbd "<escape>"))
(global-set-key (kbd "<escape>") (kbd "C-g"))
(global-unset-key (kbd "C-SPC"))
(global-unset-key (kbd "C-."))

;; Space keybindings
(use-package expand-region)
(general-define-key
 "C-=" 'er/expand-region
 "C-SPC b b" 'bm-toggle
 "C-SPC b n" 'bm-next
 "C-SPC b p" 'bm-previous
 "C-SPC s" 'replace-string
 "C-SPC c" 'sp-change-enclosing
 "C-SPC DEL" 'total-delete-line
 "C-SPC f f" 'vimish-fold
 "C-SPC f d" 'vimish-fold-delete
 "C-SPC f a" 'format-all-buffer
 "C-SPC w" 'advance-words-count
 "C-SPC j" 'avy-goto-char
 "C-SPC e m" 'org-babel-execute-src-block
 "C-SPC e p" 'org-latex-export-to-pdf
 "C-SPC u r" 'uncomment-region
 )

;; C-, keybindings
(general-define-key
 "C-. o i" 'open-init-file
 "C-. o z" 'open-zsh-file
 "C-. o k" 'open-kbd-file)

;; keybindings for multiple cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(general-define-key
 :keymaps 'c++-mode-map
 "C-;" 'add-divided-symbol
 "<f9>" 'code-compile)

(general-define-key
 :keymaps 'java-mode-map
 "C-;" 'add-divided-symbol
 )

(general-define-key
 :keymap 'python-mode-map
 "C-;" 'add-common-symbol
 )

;; Dunp-Jump
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(setq xref-show-definitions-function #'xref-show-definitions-completing-read)
(defhydra dumb-jump-hydra (:color blue :columns 3)
  "Dumb Jump"
  ("j" dumb-jump-go "Go")
  ("o" dumb-jump-go-other-window "Other window")
  ("e" dumb-jump-go-prefer-external "Go external")
  ("x" dumb-jump-go-prefer-external-other-window "Go external other window")
  ("i" dumb-jump-go-prompt "Prompt")
  ("l" dumb-jump-quick-look "Quick look")
  ("b" dumb-jump-back "Back"))

(global-set-key [next] 'good-scroll-up-full-screen)
(global-set-key [prior] 'good-scroll-down-full-screen)

(use-package easy-kill)
(global-set-key [remap kill-ring-save] 'easy-kill)
(global-set-key [remap mark-sexp] 'easy-mark)
(put 'narrow-to-region 'disabled nil)
(provide 'init-key)
