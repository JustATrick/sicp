#! /usr/bin/guile \
-e main -s
!#
; coding: utf-8
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess old-guess)
  ; watch out for a guess of zero!
  (< (abs (- guess old-guess)) (* 0.001 guess)))
(define (sqrt-iter guess old-guess x)
  (if (good-enough? guess old-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))
(define (sqrt x) (sqrt-iter 1.0 2.0 x))
(define (square x) (* x x))
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
