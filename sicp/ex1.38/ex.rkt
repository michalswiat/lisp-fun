#lang racket

; itertive
(define (cont-frac n d k)
  (define (f k acc)
    (if (= k 1)
      (/ (n 1) acc)
      (f (- k 1) (+ (d (- k 1)) (/ (n k) acc)))))
  (f k (d k)))

(define (di i)
  (if (= i 1)
    1
    (if (= (modulo (- i 2) 3) 0)
      (+ 2 (* (/ (- i 2) 3) 2))
      1)))

(define (e)
  (+ (cont-frac (lambda (i) 1.0)
	     (lambda (i) (di i))
	     100)
     2))

(e)
