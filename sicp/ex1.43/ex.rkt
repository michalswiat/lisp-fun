#lang racket

(define (rep f n)
  (if (= n 1)
    f
    (rep (lambda (x) (f (f x))) (- n 1))))

((rep (lambda (x) (* x x)) 2) 5)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (rep-c f n)
  (if (= n 1)
    f
    (rep-c (compose f f) (- n 1))))

((rep-c (lambda (x) (* x x)) 2) 5)
