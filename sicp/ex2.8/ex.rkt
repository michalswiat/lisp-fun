#lang racket

(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (sub-interval ia ib)
  (make-interval (- (lower-bound ia) (lower-bound ib))
		 (- (upper-bound ia) (upper-bound ib))))

(sub-interval (make-interval 0 12) (make-interval 7 9))
