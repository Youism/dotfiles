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

;; (require 'lsp-latex)
;; (setq lsp-latex-texlab-executable "/opt/homebrew/bin/texlab")
;; (with-eval-after-load "tex-mode"
;;   (add-hook 'tex-mode-hook 'lsp)
;;   (add-hook 'latex-mode-hook 'lsp))
;; (with-eval-after-load "bibtex"
;;   (add-hook 'bibtex-mode-hook 'lsp))

(use-package ox-reveal)


(setq org-latex-pdf-process '("xelatex -interaction  nonstopmode %f"
                              "xelatex -interaction  nonstopmode %f"))
(setq org-latex-default-packages-alist
      (remove '("AUTO" "inputenc" t) org-latex-default-packages-alist))


(setq org-cite-use-notes t)
(setq org-cite-global-prefer-notes '([-]))

(provide 'init-latex)
