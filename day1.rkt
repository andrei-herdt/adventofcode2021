#lang racket

(define (adjacent_diff f v)
  (for/list ([x v][xs (cdr v)])
            (- xs x)))

(for/fold ([sum 0])
          ([inc (adjacent_diff - (file->list "day1.txt"))])
          (cond 
            [(> inc 0) (+ sum 1) sum]))
