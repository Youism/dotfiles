(require 'init-which)
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-treemacs
  :after lsp)

(use-package lsp-ivy)


(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))


(use-package lsp-treemacs
  :after lsp)


(use-package lsp-ivy)
(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))



(setq lsp-ui-doc-position 'bottom)


(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-hover nil)



;; Sensible line breaking
(add-hook 'text-mode-hook 'visual-line-mode)

;; Overwrite selected text


(require 'lsp-mode)

;; Start lsp when you open a file for each langauge
(add-hook 'python-mode-hook #'lsp)
(add-hook 'go-mode-hook     #'lsp)
(add-hook 'c++-mode-hook     #'lsp)
(add-hook 'c-mode-hook     #'lsp)
(add-hook 'LaTeX-mode-hook     #'lsp)
(add-hook 'tex-mode-hook     #'lsp)
;;(add-hook 'java-mode-hook     #'lsp)
;; Add more languages as needed
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)



(setq lsp-clients-pyls-library-directories "~/Library/Python/3.10/bin")
(put 'downcase-region 'disabled nil)


;; for java dev
(use-package projectile)
(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration)))
(use-package hydra)
(use-package company)
(use-package lsp-ui)
(use-package which-key :config (which-key-mode))
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil)
(use-package helm-lsp)
(use-package yasnippet :ensure t)
(require 'yasnippet)
(require 'dap-lldb)

(yas-global-mode 1)
;;# NO ADDITIONAL IMPORTS ALLOWED!
;; Enable autopep8
(use-package py-autopep8
  :config
  (setq py-autopep8-options '("--max-line-length=100" "--aggressive"))
  :hook ((python-mode) . py-autopep8-mode))

(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

(put 'upcase-region 'disabled nil)

(provide 'init-lsp)
