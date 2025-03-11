#lang racket

(define (filter-acc combiner predict null-value term a next b)
  (define (checked-term x)
    (if (predict x)
      (term x)
      null-value))
  (if (> a b)
    null-value
    (combiner (checked-term a)
	      (filter-acc combiner predict null-value term (next a) next b))))

(define (sqrt x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (sqrt test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (exa a b)
  (define (next x) (+ x 1))
  (filter-acc + prime? 0 sqrt a next b))

(exa 2 4)

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (exb n)
  (define (next x) (+ x 1))
  (define (rel-prime? x) (= (gcd x n) 1))
  (define (identity x) x)
  (filter-acc * rel-prime? 1 identity 1 next n))

(exb 10)
