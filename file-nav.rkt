#lang racket/base
(require racket/file)
(require 2htdp/batch-io)

(define (file-to-list file)

	   (display (find-system-path 'home-dir))
	   (display (file->lines "../conf.properties"))
	   (display (read-1strings "../conf.properties")) ;; read char by char
       ; (for ([line (in-lines file)]) ;; Does work for lines 
       ;       (displayln line)
       ; )
)


(define (file-to-lines file-path)

	  ; (display (find-system-path 'home-dir))
	   ; (display (file->lines file-path))
	   (display (file->list file-path))
	   (display (read-1strings file-path)) ;; read char by char

)
(define (read-next-line-iter file)
     (let ((line (read-line file 'any)))
       (unless (eof-object? line)
         (display line)
         (newline)
         (read-next-line-iter file))))

; (define call-it 
;      ; (call-with-input-file "../conf.properties" read-next-line-iter)
;      (call-with-input-file "../conf.properties" file-to-list)
; )

 ; (define call-f  
 ;     (define in (open-input-file "../conf.properties")
 ;       (for ([line (in-lines in)] 
 ;         (displayln line)))
 ;       (close-input-port in))
 ; )

; (module+ main (call-with-input-file "../conf.properties" file-to-list))
(module+ main (file-to-lines "../conf.properties"))
