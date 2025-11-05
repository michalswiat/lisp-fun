#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    null
    (cons (accumulate op init (map (lambda (x) (car x)) seqs))
	  (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x))  m))

(define (transpone m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpone n)))
    (map (lambda (r) (map (lambda (c) (dot-product r c)) cols)) m)))

(define matrix (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(dot-product (list 1 2 3) (list 4 5 6))
(matrix-*-vector matrix (list 1 2 3))
(transpone matrix)
(matrix-*-matrix matrix matrix)
