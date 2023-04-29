(require 'init-package)

(use-package no-littering)

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; (use-package beacon)
;; (beacon-mode 1)
(use-package beacon
  :init (beacon-mode 1))

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


(set-face-attribute 'default nil :font "Sarasa Term SC" :height efs/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Sarasa Term SC" :height efs/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Sarasa Term SC" :height efs/default-variable-font-size :weight 'regular)



(defvar theme-list '(doom-ayu-mirage doom-palenight doom-ayu-dark doom-badger doom-challenger-deep doom-dark+ doom-dracula doom-earl-grey doom-ephemeral doom-fairy-floss doom-gruvbox doom-henna doom-homage-black doom-lantern doom-monokai-octagon doom-monokai-pro doom-one doom-opera doom-outrun-electric doom-tokyo-night doom-tomorrow-night doom-vibrant doom-sourcerer doom-ephemeral  doom-fairy-floss        doom-feather-dark doom-feather-light      doom-flatwhite          doom-gruvbox            doom-gruvbox-light      doom-henna      doom-homage-black  doom-homage-white  doom-horizon      doom-Iosvkem    doom-ir-black   doom-lantern    doom-laserwave  doom-manegarm   doom-material      doom-material-dark  doom-meltbus        doom-miramare   doom-molokai    doom-monokai-classic doom-monokai-machine doom-monokai-octagon doom-monokai-pro    doom-monokai-ristret  doom-moonlight     doom-nord       doom-nord-aurora doom-nord-light doom-nova doom-oceanic-next doom-old-hope doom-one doom-one-light doom-opera doom-opera-light doom-outrun-electricported doom-palenight doom-peacock doom-pine  doom-rouge  doom-snazzy doom-solarized-dark  doom-solarized-light doom-sourcerer doom-spacegrey doom-tokyo-night doom-tomorrow-day doom-tomorrow-night doom-vibrant doom-wilmersdorf doom-xcode doom-zenburn))
;; (defvar theme-list '(doom-ayu-mirage))
(defvar theme-name (nth (random (length theme-list)) theme-list))
(use-package doom-themes
  :init (load-theme theme-name t))
(message "Theme name is %s" theme-name)


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
(provide 'init-ui)
