;; semx package
(use-package smex
  :ensure t
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-x") 'smex-major-mode-commands))


(use-package helm
  :init
  (helm-mode 1)
  :bind
  (("M-x"     . helm-M-x) ;; Evaluate functions
   ("C-x C-f" . helm-find-files) ;; Open or create files
   ("C-x b"   . helm-mini) ;; Select buffers
   ("C-x C-r" . helm-recentf) ;; Select recently saved files
   ("C-c i"   . helm-imenu) ;; Select document heading
   ("M-y"     . helm-show-kill-ring) ;; Show the kill ring
   :map helm-map
   ("C-z" . helm-select-action)
   ("<tab>" . helm-execute-persistent-action)))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))



(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))



(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


;; bm.el
(setq bm-in-lifo-order t)
;; (setq temporary-bookmark-p t)
(setq bm-cycle-all-buffers t)
;; (setq lsp-session-file "/Volumes/Samsung_T5/.Cache/Session")


;; Format-all
(add-hook 'prog-mode-hook 'format-all-mode)
(add-hook 'format-all-mode-hook 'format-all-ensure-formatter)

(drag-stuff-mode t)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

(provide 'init-utility)
