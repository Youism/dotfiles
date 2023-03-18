;; Package
;; bm.el 
;; Define the init filen
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))
(setq make-backup-files nil
      auto-save-default t)
;; fullscreen em
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'after-make-frame-functions 'toggle-frame-fullscreen)

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "kbd.el")
(electric-pair-mode 1)
(hl-line-mode t)
;; (setq-default indent-tabs-mode nil)
;; insert yes/or to y/n
(defalias 'yes-or-no-p 'y-or-n-p)

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

;; You will most likely need to adjust this font size for your system!
(defvar efs/default-font-size 160)
(defvar efs/default-variable-font-size 160)

;; Make frame transparency overridable
(defvar efs/frame-transparency '(95 . 95))


;; Initialize package sources
(require 'package)

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

;; no-littering doesn't set this by default so we must place
;; auto save files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))


(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Set frame transparency
(set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


(set-face-attribute 'default nil :font "Fira Code Retina" :height efs/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height efs/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Fira Code Retina" :height efs/default-variable-font-size :weight 'regular)



(defvar theme-list '(doom-ayu-mirage doom-palenight doom-ayu-dark doom-badger doom-challenger-deep doom-dark+ doom-dracula doom-earl-grey doom-ephemeral doom-fairy-floss doom-gruvbox doom-henna doom-homage-black doom-lantern doom-monokai-octagon doom-monokai-pro doom-one doom-opera doom-outrun-electric doom-tokyo-night doom-tomorrow-night doom-vibrant doom-sourcerer doom-ephemeral  doom-fairy-floss        doom-feather-dark doom-feather-light      doom-flatwhite          doom-gruvbox            doom-gruvbox-light      doom-henna      doom-homage-black  doom-homage-white  doom-horizon      doom-Iosvkem    doom-ir-black   doom-lantern    doom-laserwave  doom-manegarm   orig doom-material      doom-material-dark  doom-meltbus        doom-miramare   doom-molokai    doom-monokai-classic doom-monokai-machine doom-monokai-octagon doom-monokai-pro    doom-monokai-ristret doom-monokai-spectru doom-moonlight     doom-nord       doom-nord-aurora doom-nord-light doom-nova doom-oceanic-next doom-old-hope doom-one doom-one-light doom-opera orig doom-opera-light doom-outrun-electricported doom-palenight doom-peacock doom-pine  doom-rouge doom-shades-of-purpl doom-snazzy doom-solarized-dark doom-solarized-dark-y doom-solarized-light doom-sourcerer doom-spacegrey doom-tokyo-night doom-tomorrow-day doom-tomorrow-night doom-vibrant doom-wilmersdorf doom-xcode doom-zenburn))
;; (defvar theme-list '(doom-ayu-mirage))
(defvar theme-name (nth (random (length theme-list)) theme-list))
(use-package doom-themes
  :init (load-theme theme-name t))
(message "Theme name is %s" theme-name)
(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))



(setq url-proxy-services '(("http" . "127.0.0.1:7890")))
(setq url-proxy-services '(("https" . "127.0.0.1:7890")))


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


(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))


(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("❀" "✪" "✹" "✦" "●" "○" "·")))
;; (setq org-list-demote-modify-bullet
;;       '(("1." . "❶") ("2." . "❷") ("3." . "❸") ("4." . "❹") ("5." . "❺") ("-" "")))

(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "➤")))
                          ("\\(->\\)"
                           0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "→")))))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))


;; This is needed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))


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

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))


(setq lsp-ui-doc-position 'bottom)


(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-hover nil)


(use-package lsp-treemacs
  :after lsp)

(use-package lsp-ivy)

 ;; Sensible line breaking
(add-hook 'text-mode-hook 'visual-line-mode)

;; Overwrite selected text
(delete-selection-mode t)

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
(setq org-reveal-root "file:///Volumes/Samsung_T5/github/reveal-ppt/reveal.js")
;; (setq org-reveal-hlevel 2)

;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;       (bootstrap-version 6))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))

(setq org-lowest-priority ?E)

;; org agenda
(setq org-directory "/Volumes/Samsung_T5/Document/RoamNotes/")
(setq org-agenda-files '("Tasks.org" "Tasks.org_archive"))


(setq org-todo-keywords
  '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
    (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

;; Configure custom agenda views
(setq org-agenda-custom-commands
  '(("d" "Dashboard"
     ((agenda "" ((org-deadline-warning-days 7)))
      (todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))
      (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

    ("n" "Next Tasks"
     ((todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))))


    ("W" "Work Tasks" tags-todo "+work")

    ;; Low-effort next actions
    ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
     ((org-agenda-overriding-header "Low Effort Tasks")
      (org-agenda-max-todos 20)
      (org-agenda-files org-agenda-files)))

    ("w" "Workflow Status"
     ((todo "WAIT"
            ((org-agenda-overriding-header "Waiting on External")
             (org-agenda-files org-agenda-files)))
      (todo "REVIEW"
            ((org-agenda-overriding-header "In Review")
             (org-agenda-files org-agenda-files)))
      (todo "PLAN"
            ((org-agenda-overriding-header "In Planning")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "BACKLOG"
            ((org-agenda-overriding-header "Project Backlog")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "READY"
            ((org-agenda-overriding-header "Ready for Work")
             (org-agenda-files org-agenda-files)))
      (todo "ACTIVE"
            ((org-agenda-overriding-header "Active Projects")
             (org-agenda-files org-agenda-files)))
      (todo "COMPLETED"
            ((org-agenda-overriding-header "Completed Projects")
             (org-agenda-files org-agenda-files)))
      (todo "CANC"
            ((org-agenda-overriding-header "Cancelled Projects")
             (org-agenda-files org-agenda-files)))))))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/Volumes/Samsung_T5/Document/RoamNotes/Tasks.org" "Inbox")
         "* TODO %?\n  %i\n")))
;; Emacs Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;; Set the banner
(setq dashboard-startup-banner 3)
;; Value can be
;; - nil to display no banner
;; - 'official which displays the official emacs logo
;; - 'logo which displays an alternative emacs logo
;; - 1, 2 or 3 which displays one of the text banners
;; - "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer
;; - a cons of '("path/to/your/image.png" . "path/to/your/text.txt")

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts t)
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)))
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)

(setq org-latex-create-formula-image-program 'imagemagick)


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

;; bm.el
(setq bm-in-lifo-order t)
;; (setq temporary-bookmark-p t)
