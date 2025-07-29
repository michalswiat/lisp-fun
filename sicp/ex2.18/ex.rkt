#lang racket

(define (reverse l)
  (define (rev l1 l2)
    (if (null? l1)
      l2
      (rev (cdr l1) (cons (car l1) l2))))
  (rev l '()))

(reverse (list 1 4 9 16 25))
