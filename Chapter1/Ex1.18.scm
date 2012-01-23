#! /usr/bin/guile -s
!#
; coding: utf-8
(define (fast-*-it a b)
  (fast-*-iter 0 a b))
(define (fast-*-iter r a b)
  ; NB even? seems to be a primitive procedure in guile
  (cond ((= b 0) r)
        ((even? b) (fast-*-iter r (double a) (halve b)))
        (else (fast-*-iter (+ r a) a (- b 1)))))
(define (double n)
  (+ n n))
(define (halve n)
  (/ n 2))
