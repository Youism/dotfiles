;; set proxy
;; (setq url-proxy-services '(("http" . "127.0.0.1:7890")))
;; (setq url-proxy-services '(("https" . "127.0.0.1:7890")))
;; set path
(setenv "PATH" (concat (getenv "PATH") ":/Users/pengyo/bin/"))
(add-to-list 'exec-path "/Users/pengyo/bin/")
(setq ob-mermaid-cli-path "/opt/homebrew/bin/mmdc")
(provide 'init-base)
