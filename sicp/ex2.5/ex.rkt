#lang racket

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (my-div z 2))
(define (cdr z)
  (my-div z 3))

(define (my-div z x)
  (define (my-div-step z step)
    (let ((tmp (/ z x)))
      (if (integer? tmp)
	(my-div-step tmp (+ step 1))
	step)))
  (my-div-step z 0))

(car (cons 3 4))
(cdr (cons 3 4))
