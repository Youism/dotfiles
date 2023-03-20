;; replaces forward-sentence
;; (global-set-key (kbd "M-n")
;;                 (lambda () (interactive) (next-line 5)))
;; ** Global Keybindings
(general-define-key
 "C-c k" 'kill-this-buffer
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
 )

(global-unset-key (kbd "<escape>"))
(global-set-key (kbd "<escape>") (kbd "C-g"))
(global-unset-key (kbd "C-SPC"))
(general-define-key
 "C-c -" 'select-current-line
 "C-=" 'er/expand-region
 "C-SPC b b" 'bm-toggle
 "C-SPC b n" 'bm-next
 "C-SPC b p" 'bm-previous
 "C-SPC s" 'replace-string
 "C-SPC c" 'sp-change-enclosing
 "C-SPC d" 'delete-current-line
 "C-SPC C-d" 'total-delete-line
 "C-SPC f f" 'vimish-fold
 "C-SPC f d" 'vimish-fold-delete
 "M-m" 'jump-char-forward
 "C-M-m" 'jump-char-backward
 "C-]" 'add-curly
 "C-c f" 'find-in-ssd
 )
;; keybindings for multiple cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(general-define-key
 :keymaps 'c++-mode-map
 "C-;" 'add-divided-symbol
 "<f9>" 'code-compile)

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

(defun code-compile ()
  (interactive)
  (unless (file-exists-p "Makefile")
    (set (make-local-variable 'compile-command)
     (let ((file (file-name-nondirectory buffer-file-name)))
       (format "%s -g -Wall -o %s %s"
           (if  (equal (file-name-extension file) "cpp") "g++" "gcc" )
           (file-name-sans-extension file)
           file)))
    (compile compile-command)))



;; keybindings for my editon
;; newline-without-break-of-line
(defun newline-without-break-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))

(global-set-key (kbd "<C-return>") 'newline-without-break-of-line)

(defun select-current-line ()
  (interactive)
  (beginning-of-line)
  (set-mark-command nil)
  (end-of-line))

;; Function for keybindings
(defun add-divided-symbol ()
  (interactive)
  (end-of-line)
  (insert ";")
  (newline-and-indent))


(defun add-common-symbol ()
  (interactive)
  (end-of-line)
  (insert ":")
  (newline-and-indent))

(defun delete-current-line ()
  (interactive)
  (beginning-of-line)
  (kill-line)
  (indent-for-tab-command))

(defun total-delete-line ()
  (interactive)
  (beginning-of-line)
  (kill-line)
  (kill-line)
  (indent-for-tab-command))
  

(defun add-curly ()
  (interactive)
  (end-of-line)
  (insert "{")
  (newline-and-indent)
  (insert "}")
  (beginning-of-line)
  (newline-and-indent)
  (previous-line)
  (indent-for-tab-command))

(defun find-in-ssd ()
  (interactive)
  (find-file "/Volumes/Samsung_T5/" ))

(defvar my-window-height (/ (* 2 (window-height)) 3))
(defun my-scroll-up ()
  (interactive)
  (scroll-up my-window-height))

(defun my-scroll-down ()
  (interactive)
  (scroll-down my-window-height))

(defun my-scroll-other-window-up ()
  (interactive)
  (scroll-other-window-up my-window-height))

(defun my-scroll-other-window-down ()
  (interactive)
  (scroll-other-window-down my-window-height))

