#lang racket

(define (average a b)
  (/ (+ a b) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	next
	(try next (+ step 1)))))
  (try first-guess 0)

(fixed-point cos 1.0)

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(sqrt 64)

(define (golden)
  (fixed-point (lambda (y) (average y (+ 1 (/ 1 y)))) 1.0))

(golden)

(define (xpow x)
  (fixed-point (lambda (y) (/ (log x) (log y))) 1.1))

(xpow 1000)

(define (xpowa x)
  (fixed-point (lambda (y) (average y (/ (log x) (log y)))) 1.1))

(xpowa 1000)
