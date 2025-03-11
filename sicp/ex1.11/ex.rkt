#lang racket

(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(f 2)
(f 3)
(f 4)
(f 24)
(f 100000)

(define (f2 n)
  (f-iter 0 1 2 n))

(define (f-iter a b c n)
  (cond ((= n 0) a)
	((= n 1) b)
	((= n 2) c)
	(else (f-iter b c (+ c (* 2 b) (* 3 a)) (- n 1)))))

(f2 2)
(f2 3)
(f2 4)
(f2 100000)
