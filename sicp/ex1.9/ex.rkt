#lang racket

(define (inc a)
  (+ a 1))
(define (dec a)
  (- a 1))

(define (plus a b)
  (printf "(plus ~a ~a)\n" a b)
  (if (= a 0) b (inc (plus (dec a) b))))

(plus 2 4) ;; recursive

(define (plus2 a b)
  (printf "(plus2 ~a ~a)\n" a b)
  (if (= a 0) b (plus2 (dec a) (inc b))))

(plus2 2 4) ;; iterative
