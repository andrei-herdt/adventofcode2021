#lang racket

(define (adjacent_diff f v)
  (for/list ([x v][xs (cdr v)])
            (- xs x)))

(count positive? (adjacent_diff - (file->list "day1.txt")))
