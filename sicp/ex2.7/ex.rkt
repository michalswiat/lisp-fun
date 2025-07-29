#lang racket

(define (make-interval a b) (cons a b))

(define (upper-bound interval) (car interval))
(define (lower-bound interval) (cdr interval))

(upper-bound (make-interval 2 3))
(lower-bound (make-interval 2 3))
