#lang br/quicklang

(provide #%module-begin)

(define-macro-cases direction
                    [(direction forward VAL)
                     #'(forwardfun VAL)]
                    [(direction down VAL)
                     #'(downfun VAL)]
                    [(direction up VAL)
                     #'(upfun VAL)]
                    [else #'(everything)])
(provide direction)

(define-macro (forwardfun VAL)
              #'(void
                  (inc_pos VAL)
                  (displayln (format "~a: ~a ~a" 'forward VAL (* depth hor_pos)))
                  )) 
(provide forwardfun)
(define-macro (upfun VAL)
              #'(void
                  (inc_height VAL)
                  (displayln (format "~a: ~a ~a" 'up VAL (* depth hor_pos)))
                  )) 
(provide upfun)
(define-macro (downfun VAL)
              #'(void
                  (decr_height VAL)
                  (displayln (format "~a: ~a ~a" 'down VAL (* depth hor_pos)))
                  )) 
(provide downfun)

(define-macro (everything)
              #'(begin
                  (module+ main
                           (displayln "no match"))))

(define depth 0)
(define hor_pos 0)

(define (inc_pos val) (set! hor_pos (+ hor_pos val)))
(define (inc_height val) (set! depth (- depth val)))
(define (decr_height val) (set! depth (+ depth val)))


