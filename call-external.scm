#lang racket
 
;; simple execution of a shell command
(system "ls")

(system "ipconfig")
 
;; capture output
;; (string-split (with-output-to-string (λ() (system "ls"))) "\n")
(string-split (with-output-to-string (λ() (system "ipconfig"))) "\n")
 
;; Warning: passing random string to be run in a shell is a bad idea!
;; much safer: avoids shell parsing, arguments passed separately
(system* "/bin/ls" "-l")
(system* "dir" )

(system* "ipconfig" "-l")
 
;; avoid specifying the executable path
; (system* (find-executable-path "/bin/ls") "-l")
;; (system* (find-executable-path "c:\\usr\\bin\\cmd.exe") "-l")
