#lang br/quicklang

(module+ reader
         (provide read-syntax))

(define (read-syntax path port)
  (define daytwo-datums
    (for/list ([daytwo-str (in-lines port)])
              (format-datum '(direction ~a) daytwo-str)))
  (strip-bindings
    #`(module daytwo-mod day2_lang/main
              #,@daytwo-datums)))

(provide #%module-begin)

(define-macro-cases direction
                    [(direction forward VAL)
                     #'(forwardfun VAL)]
                    [(direction forward)
                     #'(forwardfunzero)]
                    [else #'(everything)])
(provide direction)

(define hor_pos 0)
(define depth 0)

(define-macro (forwardfun VAL)
              #'(begin
                  (module+ main
                           (displayln (format "~a: ~a" 'forward VAL))
                           )))

(define val
  (let ([val-cache (make-hash)])
    (lambda (num-or-wire)
      (if (number? num-or-wire)
          num-or-wire
          (hash-ref! val-cache num-or-wire num-or-wire)))))

(define-macro (forwardfunzero)
              #'(begin
                  (module+ main
                           (displayln (format "~a: " 'forward)))))

(define-macro (everything)
              #'(begin
                  (module+ main
                           (displayln "asdf"))))

; TODO: Is define-macro-cases needed?
; TODO: Isn't stacker already enough


