#lang racket

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt 0.0003) ;; not accurate
(sqrt 999999999999)

(define (new-sqrt-iter guess prev-guess x)
  (if (diff-good-enough? guess prev-guess)
    guess
    (new-sqrt-iter (improve guess x) guess x)))

(define (diff-good-enough? prev now)
  (< (abs (- prev now)) 0.001))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 0.0 x))

(new-sqrt 9)
(new-sqrt 0.0003) ;; accurate
(new-sqrt 999999999999)
