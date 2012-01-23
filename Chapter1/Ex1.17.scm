#! /usr/bin/guile -s
!#
; coding: utf-8
(define (fast-* a b)
  ; NB even? seems to be a primitive procedure in guile
  (cond ((= b 0) 0)
        ((even? b) (double (fast-* a (halve b))))
        (else (+ a (fast-* a (- b 1))))))
(define (double n)
  (+ n n))
(define (halve n)
  (/ n 2))
