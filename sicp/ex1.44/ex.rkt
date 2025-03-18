#lang racket

(define (rep f n)
  (if (= n 1)
    f
    (rep (lambda (x) (f (f x))) (- n 1))))

(define (avg3 a b c)
  (/ (+ a b c) 3))

(define dx 0.00001)
(define (smooth f)
  (lambda (x) (avg3 (f (- x dx)) (f x) (f (+ x dx)))))

((smooth (lambda (x) (* x x))) 4)

(((rep smooth 4) (lambda (x) (* x x))) 4)
