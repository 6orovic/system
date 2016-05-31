#lang racket/base
(require racket/file)
(require 2htdp/batch-io)
(require json)

(define x (string->jsexpr "{\"foo\": \"bar\", \"bar\": \"baz\"}"))


 

(define (file-to-lines file-path)

	(for (((key val) (in-hash x)))
	  (printf "~a = ~a~%" key val))


	   (display (file->list file-path))
	   (display (read-1strings file-path)) ;; read char by char
)

 ; (jsexpr? x [#:null jsnull]

;  (require json)
; (define x (string->jsexpr "{\"foo\": \"bar\", \"bar\": \"baz\"}"))
; (for (((key val) (in-hash x)))
;   (printf "~a = ~a~%" key val))

; (require net/http-client json)
; (define-values (status header response)
;   (http-sendrecv "httpbin.org" "/ip" #:ssl? 'tls))
; (define data (read-json response))
; (printf "My IP address is ~a~%" (hash-ref data 'origin))

; At the OP's request, here's how you can create a JSON value from a structure type:
; (require json)
; (struct person (first-name last-name age country))
; (define (person->jsexpr p)
;   (hasheq 'first-name (person-first-name p)
;           'last-name (person-last-name p)
;           'age (person-age p)
;           'country (person-country p)))
; (define cky (person "Chris" "Jester-Young" 33 "New Zealand"))
; (jsexpr->string (person->jsexpr cky))


 (module+ main (file-to-lines "../data.json"))