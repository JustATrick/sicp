#! /usr/bin/guile -s
!#
; coding: utf-8
(define (reverse items)
  (define (iter items reversed)
    (if (null? items)
        reversed
        (iter (cdr items) (cons (car items) reversed))))
  (iter items '()))
