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
 (global-set-key (kbd "M-g M-g")
                 (lambda () (interactive) (beginning-of-buffer)))
 (global-set-key (kbd "M-g M-e")
                 (lambda () (interactive) (end-of-buffer)))
 (global-set-key (kbd "C-c c")
                 (lambda () (interactive) (eval-buffer)))

;; (define-key key-translation-map (kbd "M-m") (kbd "C-@"))
(define-prefix-command 'my-prefix-map)
;; (global-set-key (kbd "C-b") 'left-char)

(general-create-definer my-leader-def
  ;; :prefix my-leader
  ;; or without a variable
  :prefix "C-c")

;; ** Global Keybindings
(my-leader-def
 "b" 'buffer-menu
 "k" 'kill-this-buffer
 "e" 'eval-buffer
 "t" 'vterm-other-window
 "s" 'switch-to-buffer
 "C-a" 'treemacs
 "C-w" 'treemacs--add-project-to-current-workspace
 "m" 'magit-commit
 "M-r" 'sp-wrap-round
 "M-c" 'sp-wrap-curly
 "RET" 'yas-expand
 )
;; ** Mode Keybindings
;; (my-leader-def
;;  :keymaps 'c++-mode-map
;;  :keymaps 'c-mode-map
 
;;  )
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
