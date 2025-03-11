#lang racket

(define (cube-iter guess x)
  (if (good-enough? guess x)
    guess
    (cube-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))


(define (good-enough? guess x)
  (< (abs (- (* guess guess guess) x)) 0.001))

(define (cube x)
  (cube-iter 1.0 x))

(cube 27)
(cube 8)
(cube 100000)

#|
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
|#
