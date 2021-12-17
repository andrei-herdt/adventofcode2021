#lang racket

(for/fold ([sum_increments 0][previous 0])
     ([line (file->lines "day1.txt")])
     (values 
       (+ sum_increments (string->number line))
       (cond [(> previous (string->number line)) previous (string->number line)])))
