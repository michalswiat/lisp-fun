#lang racket

(define x (list (list 1 2) (list 3 4)))
(define y (list (list 1 2 3) (list 4 5 6) 7))
(define z (list (list 1 2 (list 3 4)) (list 5 6) 7))

(define (deep-reverse l)
  (define (deep-reverse-iter l1 l2)
    (if (null? l1)
      l2
      (if (not (pair? (car l1)))
	(deep-reverse-iter (cdr l1) (cons (car l1) l2))
	(deep-reverse-iter (cdr l1) (cons (deep-reverse-iter (car l1) '()) l2)))))
  (deep-reverse-iter l '()))

(deep-reverse x)
(deep-reverse y)
(deep-reverse z)

