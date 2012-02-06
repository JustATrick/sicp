#! /usr/bin/guile -s
!#
; coding: utf-8
(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

; guile> (subsets (list 1 2 3))
; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

; The base case ensures that the empty set is always a member of the subsets.
; The reduction step is that the subsets of s are the subsets of the cdr of s
; plus each of those sets repeated, but with the inclusion of the car of s.
