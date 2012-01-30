#! /usr/bin/guile -s
!#
; coding: utf-8
(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))
