#lang racket

(define (cube x)
  (* x x x))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
	      (accumulate combiner null-value term (next a) next b))))

(define (iaccumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b) dx))

(integral cube 0 1 0.01)

(define (product term a next n)
  (iaccumulate * 1 term a next n))

(define (factorial n)
  (define (next x)
    (+ x 1))
  (define (identity x) x)
  (product identity 1 next n))

(factorial 10)
