#lang racket

(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (iproduct term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter term (next a) (* (term a) result))))
    (iter a 1))

(define (factorial fproduct n)
  (define (next x)
    (+ x 1))
  (define (identity x) x)
  (product identity 1 next n))

(factorial product 10)
(factorial iproduct 10)

(define (pi n)
  (define (next x) (+ x 2))
  (define (sqr x) (* x x))
  (* 4 (* 2 (+ n 2))  (/ (product sqr 4 next (- n 2))
			 (product sqr 3 next n))))

(pi 1000.0)
