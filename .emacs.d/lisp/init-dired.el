
(use-package dired-single)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-open
  :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  (setq dired-open-extensions '(("png" . "feh")
                                ("mkv" . "mpv"))))

(defun my-dired-mode-hook ()
  "My `dired' mode hook."
  ;; To hide dot-files by default
  (dired-hide-dotfiles-mode))

;; To toggle hiding
(define-key dired-mode-map "." #'dired-hide-dotfiles-mode)
(add-hook 'dired-mode-hook #'my-dired-mode-hook)


(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)

(use-package multiple-cursors)
(require 'multiple-cursors)
(windmove-default-keybindings)


;; (require 'lsp)
;; (require 'lsp-haskell)
;; ;; Hooks so haskell and literate haskell major modes trigger LSP setup
;; (add-hook 'haskell-mode-hook #'lsp)
;; (add-hook 'haskell-literate-mode-hook #'lsp)
(good-scroll-mode 1)

;; (setq image-dired-dir "/Volumes/Samsung_T5/Pictures")
;; (setq image-dired-external-viewer "/usr/bin/qlmanage -p")
;; (setq image-dired-external-viewer-args (list "-p"))

(provide 'init-dired)
