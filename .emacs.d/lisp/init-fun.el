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

(defvar my-window-height (/ (window-height) 2))
(defun my-scroll-up ()
  (interactive)
  (scroll-up my-window-height))

(defun my-scroll-down ()
  (interactive)
  (scroll-down my-window-height))

(defun my-scroll-other-window-up ()
  (interactive)
  (scroll-other-window my-window-height))

(defun my-scroll-other-window-down ()
  (interactive)
  (scroll-other-window-down my-window-height))


(defun my-next-buffer ()
  "Switch to the next buffer that is not surrounded by asterisks."
  (interactive)
  (let ((current-buffer-name (buffer-name))
        (starred-buffer-regexp "\\*.*\\*"))
    (next-buffer)
    (while (and (not (eq current-buffer-name (buffer-name)))
                (string-match-p starred-buffer-regexp (buffer-name)))
      (next-buffer))))


(defun my-previous-buffer ()
  "Switch to the previous buffer that is not surrounded by asterisks."
  (interactive)
  (let ((current-buffer-name (buffer-name))
        (starred-buffer-regexp "\\*.*\\*"))
    (previous-buffer)
    (while (and (not (eq current-buffer-name (buffer-name)))
                (string-match-p starred-buffer-regexp (buffer-name)))
      (previous-buffer))))


(defun open-file-in-vertical-split (filename)
  "Open FILENAME in a new vertical split window."
  (interactive)
  (split-window-right)
  (find-file filename))

(defvar zsh-file "~/.zshrc")
(defvar init-file "~/.emacs.d/init.el")
(defvar kbd-file "~/.emacs.d/lisp/init-key.el")

(defun open-zsh-file ()
  (interactive)
  (open-file-in-vertical-split zsh-file))

(defun open-init-file ()
  (interactive)
  (open-file-in-vertical-split init-file))

(defun open-kbd-file ()
  (interactive)
  (open-file-in-vertical-split kbd-file))

(defun select-line-to-the-end ()
  (interactive)
  (beginning-of-line)
  (set-mark (point))
  (end-of-line))


(defun select-line-to-the-start ()
  (interactive)
  (end-of-line)
  (set-mark (point))
  (beginning-of-line))


(defun insert-line-above ()
  (interactive)
  (previous-line)
  (end-of-line)
  (newline-and-indent))






(provide 'init-fun)
