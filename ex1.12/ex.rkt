#lang racket

(define (pascal l n)
  (if (= n 0)
    l
    (pascal (build l '()) (- n 1))))

(define (build l new-l)
  (cond ((null? l) new-l)
	((null? (cdr l)) (build (cdr l) (append '(1) new-l '(1))))
	(else (build (cdr l) (append (list (+ (car l) (car (cdr l)))) new-l)))))

(pascal '(1) 5)
