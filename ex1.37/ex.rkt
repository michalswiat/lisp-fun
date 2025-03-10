#lang racket

; itertive
(define (cont-frac n d k)
  (define (f k acc)
    (if (= k 1)
      (/ (n 1) acc)
      (f (- k 1) (+ (d (- k 1)) (/ (n k) acc)))))
  (f k (d k)))

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11)

; recursive
(define (cont-frac-r n d k)
  (define (f i)
    (if (= i k)
      (d i)
      (+ (d (- i 1)) (/ (n i) (f (+ i 1))))))
  (/ (n 1) (f 2)))


(cont-frac-r (lambda (i) 1.0)
	     (lambda (i) 1.0)
	     12)
