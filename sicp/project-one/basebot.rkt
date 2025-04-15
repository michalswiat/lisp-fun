#lang racket

;;; idea is to simulate a baseball robot
;; imagine hitting a ball with an initial velocity of v 
;; at an angle alpha from the horizontal, at a height h
;; we would like to know how far the ball travels.

;; as a first step, we can just model this with simple physics
;; so the equations of motion for the ball have a vertical and a 
;; horizontal component

;; the vertical component is governed by
;; y(t) = v sin alpha t + h - 1/2 g t^2 
;; where g is the gravitational constant of 9.8 m/s^2

;; the horizontal component is governed by
;; x(t) = v cos alpha t
;; assuming it starts at the origin

;; First, we want to know when the ball hits the ground
;; this is governed by the quadratic equation, so we just need to know when 
;; y(t)=0 (i.e. for what t_impact is y(t_impact)= 0).
;; note that there are two solutions, only one makes sense physically

;; Helpers
(define square
  (lambda (x) (* x x)))

(define gravity 9.8) ;; in m/s

;; Problem 1
(define position
  (lambda (a v u t)
    (+ (/ (* a (square t)) 2) (* v t) u)))

;; Test block for problem 1

(position 0 0 0 0)	; -> 0
(position 0 0 20 0)	; -> 20
(position 0 5 10 10)	; -> 60
(position 2 2 2 2)	; -> 10
(position 5.0 5 5 5)	; -> 92,5
(position 0 0 0 1000)	; -> 0
(position 2 1 0 1)	; -> 2

;; Problem 2

(define (root delta a b sign)
  (/ (+ (* b -1) (* (sqrt delta) sign)) (* 2 a)))

(define (delta a b c)
  (- (square b) (* 4 a c)))

; without check for delta racket is casting < 0 to complex numbers
(define root1
  (lambda (a b c)
    (let ((d (delta a b c)))
      (if (< d 0)
	false
	(root d a b 1)))))

(define root2
  (lambda (a b c)
    (let ((d (delta a b c)))
      (if (< d 0)
	false
	(root d a b -1)))))

; x^2 - 9 = 0
(root1 1 0 -9)
(root2 1 0 -9)

; x^2 + 9 = 0
(root1 1 0 9)
(root2 1 0 9)

; Problem 3

(define time-to-impact
  (lambda (vertical-velocity elevation)
    (time-to-height vertical-velocity elevation 0)))

;; Note that if we want to know when the ball drops to a particular height r 
;; (for receiver), we have

(define time-to-height
  (lambda (vertical-velocity elevation target-elevation)
    (let ((r1 (root1 (* -0.5 gravity) vertical-velocity (- elevation target-elevation)))
	  (r2 (root2 (* -0.5 gravity) vertical-velocity (- elevation target-elevation))))
      (if (<= r1 0)
	r2
	r1))))

;; tests
(time-to-impact 24.5 0)
(time-to-impact 24.5 100)
(time-to-impact 10 100)

;(time-to-height 24.5 0 100)
(time-to-height 24.5 0 2)
(time-to-height 10 0 5)
