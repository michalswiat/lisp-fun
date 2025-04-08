#lang racket

(define (average a b)
  (/ (+ a b) 2))

(define (iterative-improve good-enough? improve)
  (define (step x)
    (if (good-enough? x)
      x
      (step (improve x))))
  step)

(define (sqrt x)
  ((iterative-improve
     (lambda (guess) (< (abs (- (* guess guess) x)) 0.001))
     (lambda (guess) (average guess (/ x guess)))) 1.0))

(sqrt 2)

(define (fixed-point f)
  ((iterative-improve
     (lambda (guess) (< (abs (- (f guess) guess)) 0.001))
     f) 1.0))

(fixed-point sin)
