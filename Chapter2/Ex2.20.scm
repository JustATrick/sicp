#! /usr/bin/guile -s
!#
; coding: utf-8
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (same-parity first . rest)
  (define (parity x)
    (if (even? x) 1 0))
  (define (append-if predicate items candidate-suffix)
    (if predicate (append items (list candidate-suffix)) items))
  (define (iter items required-parity selected)
    (if (null? items)
          selected
          (iter (cdr items)
	        required-parity
                (append-if (= required-parity (parity (car items)))
                           selected
                           (car items)))))
  (iter rest (parity first) (list first)))
