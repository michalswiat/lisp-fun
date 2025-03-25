#lang racket

(define (average a b)
  (/ (+ a b) 2))

(define (average-dump f)
  (lambda(x) (average (f x) x)))

(define (rep f n)
  (if (= n 1)
    f
    (rep (lambda (x) (f (f x))) (- n 1))))

(define tolerance 0.000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	next
	(try next (+ step 1)))))
  (try first-guess 0))

(define (sqrt-n x n)
  (fixed-point ((rep average-dump (floor (/ (log n) (log 2)))) (lambda(y) (/ x (expt y (- n 1))))) 1.0))

(sqrt-n 256 8)
