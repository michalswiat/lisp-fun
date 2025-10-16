#lang racket

(define (avg a b)
  (/ (+ a b) 2))

(define (make-segment start end)
  (cons start end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

(define (print-segment segment)
  (newline)
  (print-point (start-segment segment))
  (display " ; ")
  (print-point (end-segment segment)))

(define (print-point point)
  (display "(")
  (display (x-point point))
  (display ",")
  (display (y-point point))
  (display ")"))

(define (midpoint-segment s)
  (make-point (avg (x-point (start-segment s)) (x-point (end-segment s)))
	      (avg (y-point (start-segment s)) (y-point (end-segment s)))))

(print-point (midpoint-segment (make-segment (make-point 1 2) (make-point 3 4))))
