#! /usr/bin/guile -s
!#
; coding: utf-8
(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
                      x)))
(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* guess 2))
     3))
(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))
(define (cube-root x)
  (cube-root-iter 1.0 x))
(define (cube x) (* x x x))
(define (square x) (* x x))
