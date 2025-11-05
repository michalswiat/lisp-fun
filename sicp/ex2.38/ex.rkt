#lang racket

(require (only-in "../list-lib.rkt" accumulate))

(define (fold-right op init seq)
  (accumulate op init seq))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
	    (cdr rest))))
  (iter initial sequence))

; 3 / 2 / 1
(fold-right / 1 (list 1 2 3))
; 1/1 / 2 / 3
(fold-left / 1 (list 1 2 3))
; (1 (2 (3)))
(fold-right list '() (list 1 2 3))
; (((1) 2) 3)
(fold-left list '() (list 1 2 3))

; +
