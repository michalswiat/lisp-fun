#lang racket

(require (only-in "../list-lib.rkt" flatmap enumerate-interval))

(define (triple n s)
  (filter (lambda (t) (= s (+ (car t) (cadr t) (caddr t))))
	  (unique-triple n)))

(define (unique-triple n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j)
		  (map (lambda (k) (list i j k))
		       (enumerate-interval 1 (- j 1))))
		  (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))

(triple 8 10)
