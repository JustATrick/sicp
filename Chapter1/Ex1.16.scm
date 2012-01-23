#! /usr/bin/guile -s
!#
; coding: utf-8
(define (fast-it-expt b n)
  (fast-it-iter 1 b n))
(define (fast-it-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-it-iter a
                                 (* b b)
				 (/ n 2)))
	(else (fast-it-iter (* a b)
			    b
		            (- n 1)))))
(define (even? n)
  (= (remainder n 2) 0))
