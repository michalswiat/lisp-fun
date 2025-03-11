#lang racket

(define (timed-prime-test p? n)
  (newline)
  (display n)
  (start-prime-test p? n (runtime)))
(define (start-prime-test p? n start-time)
  (when (p? n)
    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes p? a b)
  (define (iter a b)
    (when (<= a b)
      (timed-prime-test p? a)
      (iter (+ a 2) b)))
  (iter (if (odd? a) a (+ a 1)) b))

(string-contains?
 (capture-output (search-for-primes prime? 6 10))
 "7 *** ")
