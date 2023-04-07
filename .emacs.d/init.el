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
(load-user-file "packages.el")
(electric-pair-mode 1)
(hl-line-mode t)
;; (setq-default indent-tabs-mode nil)
;; insert yes/or to y/n
(defalias 'yes-or-no-p 'y-or-n-p)



;; You will most likely need to adjust this font size for your system!
(defvar efs/default-font-size 160)
(defvar efs/default-variable-font-size 160)

;; Make frame transparency overridable
(defvar efs/frame-transparency '(98 . 98))


;; Initialize package sources
(require 'package)


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
		vterm-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


(set-face-attribute 'default nil :font "Iosevka Fixed SS04" :height efs/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Iosevka Fixed SS04" :height efs/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Iosevka Fixed SS04" :height efs/default-variable-font-size :weight 'regular)



(defvar theme-list '(doom-ayu-mirage doom-palenight doom-ayu-dark doom-badger doom-challenger-deep doom-dark+ doom-dracula doom-earl-grey doom-ephemeral doom-fairy-floss doom-gruvbox doom-henna doom-homage-black doom-lantern doom-monokai-octagon doom-monokai-pro doom-one doom-opera doom-outrun-electric doom-tokyo-night doom-tomorrow-night doom-vibrant doom-sourcerer doom-ephemeral  doom-fairy-floss        doom-feather-dark doom-feather-light      doom-flatwhite          doom-gruvbox            doom-gruvbox-light      doom-henna      doom-homage-black  doom-homage-white  doom-horizon      doom-Iosvkem    doom-ir-black   doom-lantern    doom-laserwave  doom-manegarm   orig doom-material      doom-material-dark  doom-meltbus        doom-miramare   doom-molokai    doom-monokai-classic doom-monokai-machine doom-monokai-octagon doom-monokai-pro    doom-monokai-ristret doom-monokai-spectru doom-moonlight     doom-nord       doom-nord-aurora doom-nord-light doom-nova doom-oceanic-next doom-old-hope doom-one doom-one-light doom-opera orig doom-opera-light doom-outrun-electricported doom-palenight doom-peacock doom-pine  doom-rouge doom-shades-of-purpl doom-snazzy doom-solarized-dark doom-solarized-dark-y doom-solarized-light doom-sourcerer doom-spacegrey doom-tokyo-night doom-tomorrow-day doom-tomorrow-night doom-vibrant doom-wilmersdorf doom-xcode doom-zenburn))
;; (defvar theme-list '(doom-ayu-mirage))
(defvar theme-name (nth (random (length theme-list)) theme-list))
(use-package doom-themes
  :init (load-theme theme-name t))
(message "Theme name is %s" theme-name)



(setq url-proxy-services '(("http" . "127.0.0.1:7890")))
(setq url-proxy-services '(("https" . "127.0.0.1:7890")))




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
    (set-face-attribute (car face) nil :font "FiraCode Nerd Font" :weight 'regular :height (cdr face)))

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



(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))



(setq lsp-ui-doc-position 'bottom)


(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-hover nil)



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

(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                              "xelatex -interaction nonstopmode %f"))
(setq org-latex-default-packages-alist
      (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))

(global-set-key [remap kill-ring-save] 'easy-kill)
(global-set-key [remap mark-sexp] 'easy-mark)
(put 'narrow-to-region 'disabled nil)
