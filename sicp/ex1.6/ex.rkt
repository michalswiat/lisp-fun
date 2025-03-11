#lang racket

(define (new-if predicate then-clause else-clause)
  (printf "new-if")
  (cond (predicate then-clause)
	(else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

(define (sum a b)
  (+ a b))

(define (new-sum a b)
  (new-if (> a b)
	  a
	  (sum a b)))

(new-if (= 2 3) 0 (sum 2 3))
(new-if (= 1 1) 0 (sum 2 3))

(new-if (= 2 3) 0 (new-sum 2 3))
(new-if (= 1 1) 0 (new-sum 2 3))

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

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (new-sqrt-iter (improve guess x) x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(new-sqrt 9) ;;won't end, because new-if always evalute both clauses
