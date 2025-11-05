#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (fold-right op init seq)
  (accumulate op init seq))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
	    (cdr rest))))
  (iter initial sequence))

(define (reverse-r seq)
  (fold-left (lambda (x y) (cons y x)) (list) seq))

(define (reverse-l seq)
  (fold-right (lambda (x y) (append y (list x))) (list) seq))

(reverse-r (list 1 2 3 4))
(reverse-l (list 1 2 3 4))
