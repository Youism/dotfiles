;;; chatgpt-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "chatgpt" "chatgpt.el" (0 0 0 0))
;;; Generated autoloads from chatgpt.el

(autoload 'chatgpt-login "chatgpt" "\
Log in to ChatGPT." t nil)

(autoload 'chatgpt-init "chatgpt" "\
Initialize the ChatGPT server.

This function creates the ChatGPT process and starts it. It also
initializes the ChatGPT buffer, enabling visual line mode in it. A
message is displayed to indicate that the initialization was
successful.

If ChatGPT server is not initialized, 'chatgpt-query' calls this
function." t nil)

(autoload 'chatgpt-stop "chatgpt" "\
Stops the ChatGPT server." t nil)

(autoload 'chatgpt-reset "chatgpt" "\
Reset the ChatGPT server. The same session is maintained." t nil)

(autoload 'chatgpt-display "chatgpt" "\
Displays *ChatGPT*." t nil)

(autoload 'chatgpt-query-by-type "chatgpt" "\
Query ChatGPT with from QUERY and interactively chosen 'query-type'.

The function uses the 'completing-read' function to prompt the
user to select the type of query to use. The selected query type
is passed to the 'chatgpt--query-by-type' function along with the
'query' argument, which sends the query to the ChatGPT model and
returns the response.

\(fn QUERY)" t nil)

(autoload 'chatgpt-query "chatgpt" "\
Query ChatGPT with QUERY.

The user will be prompted to enter a query if none is provided. If
there is an active region, the user will be prompted to select the
type of query to perform.

Supported query types are:

* doc: Ask for documentation in query
* bug: Find bug in query
* improve: Suggestions for improving code
* understand: Query for understanding code or behavior

\(fn QUERY)" t nil)

(register-definition-prefixes "chatgpt" '("chatgpt-"))

;;;***

(provide 'chatgpt-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; chatgpt-autoloads.el ends here
