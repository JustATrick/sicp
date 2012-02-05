#! /usr/bin/guile -s
!#
; coding: utf-8
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1))
(define (cc amount coin-values)
  (define (no-more? coins) (null? coins))
  (define (first-denomination coins) (car coins))
  (define (except-first-denomination coins) (cdr coins))
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

; Q. does the order of the list coin-values affect the answer
;    produced by cc?
; A. No, it doesn't.
;
; Q. Why not?
;    The algorithm describes a tree-recursive process. The order
;    of the coin-values list affects the order in which the nodes
;    of the tree are examined, but all nodes are still explored
;    and each still returns the same value.
