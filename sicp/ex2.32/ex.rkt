#lang racket

(define (subset s)
  (if (null? s)
    ;(list null) != '()
    (list '())
    (let ((r (subset (cdr s))))
      (append r (map (lambda (set) (cons (car s) set))  r)))))

(subset (list 1 2 3))
