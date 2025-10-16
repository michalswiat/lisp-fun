#lang racket

(define x (list (list 1 2) (list 3 4)))

(define (fringe l)
  (define (fringe-iter l1 l2)
    (if (null? l1)
      l2
      (if (not (pair? (car l1)))
	(fringe-iter (cdr l1) (append l2 (list (car l1))))
	(fringe-iter (cdr l1) (append l2 (fringe-iter (car l1) '()))))))
  (fringe-iter l '()))

(fringe x)
(fringe (list x x))

