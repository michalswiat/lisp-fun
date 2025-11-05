#lang racket

(provide accumulate
	 accumulate-n
	 fold-right
	 fold-left
	 reverse)

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    null
    (cons (accumulate op init (map (lambda (x) (car x)) seqs))
	  (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(define (fold-right op init seq)
  (accumulate op init seq))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
	    (cdr rest))))
  (iter initial sequence))

(define (reverse seq)
  (fold-left (lambda (x y) (cons y x)) (list) seq))
