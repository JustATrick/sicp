#! /usr/bin/guile -s
!#
; coding: utf-8
(define (square x) (* x x))

(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

; guile> (square-tree
; ...  (list 1
; ...        (list 2 (list 3 4) 5)
; ...        (list 6 7)))
; (1 (4 (9 16) 25) (36 49))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-map sub-tree)
             (square sub-tree)))
       tree))

; guile> (square-tree-map
; ...  (list 1
; ...        (list 2 (list 3 4) 5)
; ...        (list 6 7)))
; (1 (4 (9 16) 25) (36 49))
