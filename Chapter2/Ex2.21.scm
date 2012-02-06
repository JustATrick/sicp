#! /usr/bin/guile -s
!#
; coding: utf-8
(define (square-list-a items)
  (define (square x) (* x x))
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-b items)
  (map (lambda (x) (* x x)) items))
