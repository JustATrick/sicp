#! /usr/bin/guile -s
!#
; coding: utf-8
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (simpson-factor k)
    (cond ((or (= k n) (= k 0)) 1)
          ((even? k) 2)
          (else 4)))
  (define (simpson-term k)
    (* (simpson-factor k) (f (+ a (* k h)))))
  (define (inc k) (+ k 1))
  (* (/ h 3)
     (sum simpson-term 0 inc n)))
