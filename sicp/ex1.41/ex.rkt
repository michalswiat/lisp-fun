#lang racket

(define (inc a)
  (+ a 1))

(define (double g)
  (lambda (x) (g (g x))))

((double inc) 1)

(((double (double double)) inc) 5)
