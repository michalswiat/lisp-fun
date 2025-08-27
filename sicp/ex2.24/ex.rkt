#lang racket

(define y (cons (list 1 2) (list 3 4)))
(define x (list 1 (list 2 (list 3 4))))

(define (length x)
  (display x)
  (newline)
  (if (null? x)
    0
    (+ 1 (length (cdr x)))))

(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x)) (count-leaves (cdr x))))))

(length x)
(count-leaves x)
