(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))


(use-package vterm
  :commands vterm
  :config
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
  (setq vterm-shell "zsh")
  (setq vterm-max-scrollback 10000))

(use-package multi-vterm :ensure t)

(setq multi-vterm-dedicated-window-height 10)
(setq multi-vterm-dedicated-window-height-percent 20)
(provide 'init-term)
