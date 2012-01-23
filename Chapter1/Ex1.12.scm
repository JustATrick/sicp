#! /usr/bin/guile -s
!#
; coding: utf-8
; Values of the triangle are addressed by (n,m) as follows:
;                 (1,1)
;              (2,1) (2,2)
;           (3,1) (3,2) (3,3)
;        (4,1) (4,2) (4,3) (4,4) 
;     (5,1) ................. (5,5)
;               ...etc...
(define (pascal n m)
  (cond ((or (= n 0) (= m 0) (> m n)) 0)
	((and (= n 1) (= m 1)) 1)
        (else (+ (pascal (- n 1) m)
                 (pascal (- n 1) (- m 1))))))
