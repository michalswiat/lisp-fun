#lang racket

(define (fast-exp b n)
  (fast-exp-iter b n 1))

(define (even? n)
  (= (modulo n 2) 0))

(define (fast-exp-iter b n a)
  (cond ((= n 0) a)
	((even? n) (fast-exp-iter (* b b) (/ n 2) a))
	(else (fast-exp-iter b (- n 1) (* b a)))))

(fast-exp 3 2)
(fast-exp 3 2000)
