#lang racket

(require (only-in "../list-lib.rkt" fold-left fold-right))

(define (reverse-r seq)
  (fold-left (lambda (x y) (cons y x)) (list) seq))

(define (reverse-l seq)
  (fold-right (lambda (x y) (append y (list x))) (list) seq))

(reverse-r (list 1 2 3 4))
(reverse-l (list 1 2 3 4))
