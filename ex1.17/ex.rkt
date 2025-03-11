#lang racket

(define (double a)
  (* a 2))

(define (halve a)
  (/ a 2))

(define (fast-mul a b)
  (cond ((= b 0) 0)
	((= b 1) a)
	((even? b) (fast-mul (double a) (halve b)))
	(else (+ a (fast-mul a (- b 1))))))

(fast-mul 3 16)

