#lang racket

(define (same-parity . p)
  (define (filter l1 l2 pred)
    (if (null? l1)
      l2
      (if (pred (car l1))
	(filter (cdr l1) (append l2 (cons (car l1) '())) pred)
	(filter (cdr l1) l2 pred))))
  (filter p '() (lambda (v) (if (even? (car p))
			      (even? v)
			      (not (even? v))))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
