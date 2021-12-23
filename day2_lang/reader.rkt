#lang br/quicklang

(define (read-syntax path port)
  (define src-lines (port->lines port))
  (define src-datums (format-datums '(direction ~a) src-lines))
  (define module-datum `(module day2-mod "expander.rkt" ,@src-datums))
  (datum->syntax #f module-datum))
(provide read-syntax)

