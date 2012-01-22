#! /usr/bin/guile \
-e main -s
!#
; coding: utf-8
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (square x) (* x x))
(define (sqrt x) (sqrt-iter 1.0 x))
(define (write-sqrt x_str)
  (define x (string->number x_str))
  (display x)
  (display "\t\t")
  (display (sqrt x))
  (display "\t\t")
  (display (square (sqrt x)))
  (newline))
(define (main args)
  (map (lambda (x) (write-sqrt x)) (cdr args)))
