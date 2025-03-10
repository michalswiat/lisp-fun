#lang racket

; itertive
(define (cont-frac n d k)
  (define (f k acc)
    (if (= k 1)
      (/ (n 1) acc)
      (f (- k 1) (- (d (- k 1)) (/ (n k) acc)))))
  (f k (d k)))

(define (ni i x)
  (if (= i 1)
    x
    (* x x)))

(define (tan-cf x k)
  (cont-frac (lambda (i) (ni i x))
	     (lambda (i) (- (* 2 i) 1))
	     k))

(tan-cf 20.0 100.0)
