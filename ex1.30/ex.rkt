#lang racket

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum term (next a) next b))))

(define (isum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (integral fsum f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (fsum f (+ a (/ dx 2)) add-dx b) dx))

; recursive
(integral sum cube 0 1 0.01)
(integral sum cube 0 1 0.001)

; iterative
(integral isum cube 0 1 0.01)
(integral isum cube 0 1 0.001)
