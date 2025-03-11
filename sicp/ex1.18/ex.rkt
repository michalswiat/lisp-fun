#lang racket

(define (double a)
  (* a 2))

(define (halve a)
  (/ a 2))

(define (fast-mul a b)
  (fast-mul-iter a b 0))

(define (fast-mul-iter a b c)
  (cond ((= b 0) c)
	((even? b) (fast-mul-iter (double a) (halve b) c))
	(else (fast-mul-iter a (- b 1) (+ c a)))))

(fast-mul 3 16)
