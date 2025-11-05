#lang racket

(require (only-in "../list-lib.rkt" accumulate accumulate-n))

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
