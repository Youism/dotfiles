;; replaces forward-sentence
(global-set-key (kbd "M-n")
                (lambda () (interactive) (next-line 5)))

;; replaces forward-sentence
(global-set-key (kbd "M-p")
                (lambda () (interactive) (previous-line 5)))


(global-set-key (kbd "C-c C-k") 'kill-this-buffer)
 (global-set-key (kbd "M-n")
                 (lambda () (interactive) (next-line 5)))
 ;; replaces forward-sentence
 (global-set-key (kbd "M-p")
                 (lambda () (interactive) (previous-line 5)))

;; (define-key key-translation-map (kbd "M-m") (kbd "C-@"))
;; ** Global Keybindings
(general-define-key
 "C-c b" 'buffer-menu
 "C-c k" 'kill-this-buffer
 "C-c e" 'eval-buffer
 "C-c t" 'vterm-other-window
 "C-c s" 'switch-to-buffer
 "C-c <f5>" 'treemacs
 "C-c w" 'treemacs-add-project-to-workspace
 "C-c m" 'magit-commit
 "C-c M-r" 'sp-wrap-round
 "C-c M-c" 'sp-wrap-curly
 "C-c RET" 'yas-expand
 "<f5>" 'treemacs
 "C-c C-u" 'sp-unwrap-sexp
 )

(global-unset-key (kbd "<escape>"))
(global-set-key (kbd "<escape>") (kbd "C-g"))
(defun code-compile ()
  (interactive)
  (unless (file-exists-p "Makefile")
    (set (make-local-variable 'compile-command)
     (let ((file (file-name-nondirectory buffer-file-name)))
       (format "%s -o %s %s"
           (if  (equal (file-name-extension file) "cpp") "g++" "gcc" )
           (file-name-sans-extension file)
           file)))
    (compile compile-command)))

(general-define-key
 :keymaps 'c++-mode-map
 "<f9>" 'code-compile)
 
;; keybindings for multiple cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


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
(global-unset-key (kbd "C-SPC"))
(general-define-key
 "C-c -" 'select-current-line
 "C-SPC SPC" 'er/expand-region
 "C-SPC a" 'beginning-of-line-text
 "C-;" 'add-divided-symbol
 )

(defun add-divided-symbol ()
  (interactive)
  (end-of-line)
  (insert ";")
  (newline-and-indent))
