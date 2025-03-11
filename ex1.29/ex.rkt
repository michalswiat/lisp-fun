#lang racket

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b) dx))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

(define (simpson f a b n)
  (define (h)
    (/ (- b a) n))
  (define (h3)
    (/ (h) 3))
  (define (next a)
    (+ a (* 2 (h))))
  (* (h3) (+ a b 
	     (* 4 (sum f (+ a (h)) next b))
	     (* 2 (sum f (+ a (* 2 (h))) next b)))))

(simpson cube 0 1.0 10.0)
(simpson cube 0 1.0 100.0)
(simpson cube 0 1.0 1000.0)
