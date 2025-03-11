#lang racket

(define (even? n)
  (= (modulo n 2) 0))

(define (square-test r m)
  (define (square-modulo x m)
    (remainder (* x x) m))
  (if (and (not (or (= r 1) (= r (- m 1)))) (= (square-modulo r m) 1))
    0
    (square-modulo r m)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (square-test (expmod base (/ exp 2) m) m))
	(else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((miller-rabin-test n) (fast-prime? n (- times 1)))
	(else false)))

(display "checking 13 ")
(fast-prime? 13 10)
(display "checking 10 ")
(fast-prime? 14 10)
(display "checking 561 ")
(fast-prime? 561 10)
(display "checking 1009 ")
(fast-prime? 1009 10)
