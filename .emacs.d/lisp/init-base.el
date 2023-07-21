;; set proxy
;; (setq url-proxy-services '(("http" . "127.0.0.1:7890")))
;; (setq url-proxy-services '(("https" . "127.0.0.1:7890")))
;; set path
(require 'init-var)
(setenv "PATH" (concat (getenv "PATH") user-common-bin-path))
(add-to-list 'exec-path user-bin-path)
(setq ob-mermaid-cli-path mmdc-path)
(provide 'init-base)
