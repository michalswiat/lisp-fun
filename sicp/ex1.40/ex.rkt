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
  (try first-guess 0))

(define dx 0.00001)

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (cube x) (* x x x))
((deriv cube) 5)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

; test
(define (sqrt x)
  (newtons-method
    (lambda (y) (- (* y y) x)) 1.0))

(sqrt 25)

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

