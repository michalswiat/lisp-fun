#lang racket

(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (add-interval ia ib)
  (make-interval (+ (lower-bound ia) (lower-bound ib))
		 (+ (upper-bound ia) (upper-bound ib))))

(define (width-interval i)
  (/ (+ (upper-bound i) (lower-bound i)) 2))

(let ((i1 (make-interval 0 12))
      (i2 (make-interval 7 9)))
  (display (width-interval i1))
  (newline)
  (display (width-interval i2))
  (newline)
  (display (width-interval (add-interval i1 i2))))
