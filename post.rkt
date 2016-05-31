#lang racket

(require net/http-client)
(require racket/file)

; (http-conn-open "localhost"
; 	            #:port 8000
;                 #:ssl? #t)
; (sleep (* 1 60)) ; sleep 1 min
; (sleep 10)

(define (job val)
	(string-append (file->string "job_task.json") val)
)
; (define job1 "{ \"description\" : \"welcome\" }")


 (define-values (status headers in)
     (http-sendrecv "localhost"
                 "/api/jobs/createJob"
                 #:port 8080
                 ; #:ssl? #t
                 #:version "1.1"
                 #:method "POST"
                 ; #:method "GET"
                 #:data (job "")
                 #:headers (list "Content-Type: application/json; charset=utf-8")))
(println (job ""))
(displayln status)
(displayln headers)
(displayln (port->string in))
(close-input-port in)


; (http-send!
;    hc "/login"
;    #:method "POST"
;    #:data
;    (alist->form-urlencoded
;     (list (cons 'username "Ryu")
;           (cons 'password "Sheng Long")))
;    #:headers (list "Content-Type: application/x-www-form-urlencoded"))

; #lang racket ;
;  (require net/http-client)
;  (require net/url)
;  (require net/uri-codec)
;  (require net/base64)
;  (require json)
; 
;  (define (authcode key)
;    (base64-encode (string->bytes/utf-8 key)))
; 
;  (define (make-customer #:email email #:token token)
; 
;    (define-values (status-code header inport)
;      (http-sendrecv
;       "api.stripe.com"
;       "/v1/customers"
;       #:ssl? #t
;       #:method "POST"
;       #:data (alist->form-urlencoded
;               (list (cons 'card "token")))
;       #:headers (list (format "Authorization: Basic ~a"
;                               (authcode
;  "sk_test_BQokikJOvBiI2HlWgH4olfQ2:")))))
;    (read-json inport))
; 
;  (make-customer #:email "jondo at example.com"
;                 #:token "tok_14unJi2eZvKYlo2C804uRph5" )
; 
; ; The above results in
; 
;  '#hasheq((error
;            .
;            #hasheq((param . "\r\ncard")
; >                   (message
; >                    .
; >                    "Received unknown parameter: \r\ncard")
; >                   (type . "invalid_request_error"))))