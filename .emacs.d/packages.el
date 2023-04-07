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
;; NOTE: init.el is now generated from Emacs.org.  Please edit that file
;;       in Emacs and init.el will be generated automatically!
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; (use-package auto-package-update
;;   :custom
;;   (auto-package-update-interval 7)
;;   (auto-package-update-prompt-before-update t)
;;   (auto-package-update-hide-results t)
;;   :config
;;   (auto-package-update-maybe)
;;   (auto-package-update-at-time "09:00"))


;; NOTE: If you want to move everything out of the ~/.emacs.d folder
;; reliably, set `user-emacs-directory` before loading no-littering!
					;(setq user-emacs-directory "~/.cache/emacs")

(use-package no-littering)

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))


(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5
        which-key-idle-secondary-delay 0.5)
  (which-key-setup-side-window-bottom))

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



(use-package ivy-prescient
  :after counsel
  :custom
  (ivy-prescient-enable-filtering nil)
  :config
  ;; Uncomment the following line to have sorting remembered across sessions!
					;(prescient-persist-mode 1)
  (ivy-prescient-mode 1))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("❀" "✪" "●" "○" "✹" "✦" "·")))
;; (setq org-list-demote-modify-bullet
;;       '(("1." . "❶") ("2." . "❷") ("3." . "❸") ("4." . "❹") ("5." . "❺") ("-" "")))

(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "➤")))
                          ("\\(->\\)"
                           0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "→")))))


(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5
        which-key-idle-secondary-delay 0.5)
  (which-key-setup-side-window-bottom))


;; Auto completion
(use-package company
  :config
  (setq company-idle-delay 0
        company-minimum-prefix-length 4
        company-selection-wrap-around t))

(global-company-mode)
(global-display-line-numbers-mode)
;; Org-Mode initial setup
(use-package org
  :bind
  (("C-c C-l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)))
;;(set-frame-font "CaskaydiaCove NF 12" nil t)
(setq org-hide-emphasis-markers t)


(use-package company
  :after lsp-mode
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection))
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

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


(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
(use-package forge)


(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


;; (use-package term
;;   :commands term
;;   :config
;;   (setq explicit-shell-file-name "zsh") ;; Change this to zsh, etc
;;   ;;(setq explicit-zsh-args '())         ;; Use 'explicit-<shell>-args for shell-specific args

;; Match the default Bash shell prompt.  Update this if you have a custom prompt
;; (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))


(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))


(use-package vterm
  :commands vterm
  :config
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
  (setq vterm-shell "zsh")
  (setq vterm-max-scrollback 10000))


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

(require 'smartparens-config)
(put 'upcase-region 'disabled nil)
(wrap-region-global-mode t)

;; for dired confi
(when (eq system-type 'darwin)
  (setq insert-directory-program "/opt/homebrew/bin/gls"))

(use-package dired-single)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-open
  :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  (setq dired-open-extensions '(("png" . "feh")
                                ("mkv" . "mpv"))))

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
			      "H" 'dired-hide-dotfiles-mode))
(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)

(require 'multiple-cursors)
(windmove-default-keybindings)
(pending-delete-mode t)

(require 'lsp)
(require 'lsp-haskell)
;; Hooks so haskell and literate haskell major modes trigger LSP setup
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)
(require 'smartparens-config)
(good-scroll-mode 1)

;; (leaf dap-mode
;;   :ensure t
;;   :init
;;   (dap-mode 1)
;;   (dap-tooltip-mode 1)
;;   (dap-auto-configure-mode 1)
;;   (dap-ui-controls-mode 1)
;;   :require t dap-lldb
;;   :bind
;;   (:dap-mode-map
;;    ([f6] . dap-debug)
;;    ("M-d i" . dap-step-in)
;;    ("M-d o" . dap-step-out)
;;    ("M-d n" . dap-next)
;;    ("M-d g" . dap-continue)
;;    ("M-d t" . dap-breakpoint-toggle))
;;   :config
;;   (leaf dap-ui
;;     :ensure nil
;;     :require t
;;     :config
;;     (dap-ui-mode 1))
;;   :custom
;;   (dap-auto-configure-features . '(sessions locals breakpoints expressions repl controls tooltip))
;;   (dap-lldb-debug-program . `(,(expand-file-name "~/.vscode/extensions/lanza.lldb-vscode-0.2.3/bin/darwin/bin/lldb-vscode"))))

;; Eval Buffer with `M-x eval-buffer' to register the newly created template.

;; (dap-register-debug-template
;;   "LLDB::Run"
;;   (list :type "lldb-vscode"
;;         :cwd "~/workspace/cpp"
;;         :request "launch"
;;         :args (list "-Q")
;;         :program "nextstep/Emacs.app/Contents/MacOS/Emacs"
;;         :name "LLDB::Run"))

(beacon-mode 1)
(vimish-fold-global-mode 1)

;; set path
(setenv "PATH" (concat (getenv "PATH") ":/Users/pengyo/bin/"))
(add-to-list 'exec-path "/Users/pengyo/bin/")
(use-package auctex
  :ensure t
  :defer t
  :hook (LaTeX-mode .
		    (lambda ()
		      (push (list 'output-pdf "sioyek")
			    Tex-view-program-selection))))
(setq TeX-engine 'xetex)
(setq TeX-command-default "XeLaTeX")
(setq TeX-save-query nil)
(setq TeX-show-compilation t)

(require 'lsp-latex)
(setq lsp-latex-texlab-executable "/opt/homebrew/bin/texlab")
(with-eval-after-load "tex-mode"
  (add-hook 'tex-mode-hook 'lsp)
  (add-hook 'latex-mode-hook 'lsp))
(with-eval-after-load "bibtex"
  (add-hook 'bibtex-mode-hook 'lsp))

(use-package ox-reveal)


;; Emacs Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))


(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "/Volumes/Samsung_T5/Document/RoamNotes"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))
