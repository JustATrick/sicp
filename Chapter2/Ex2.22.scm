#! /usr/bin/guile -s
!#
; coding: utf-8
(define (square x) (* x x)

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items '()))

; guile> (square-list (list 1 2 3 4 5))
; (25 16 9 4 1)
;
; The result is reversed because, on each iteration Louis adds creates
; an answer list with the new value prepended to it. The answer for the
; first list item is pushed on the front first, followed by the answer to
; the second item, and so on. This means the list is reversed.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

; guile> (square-list (list 1 2 3 4 5))
; (((((() . 1) . 4) . 9) . 16) . 25)
;
; Reversing the arguments to cons doesn't help, because it doesn't produce
; a list, instead producing a nested-pair structure. It doesn't properly look
; after the links between the nodes.
;
; Louis either needs to use append, rather than cons when building his answer,
; or simply remember to reverse the list before returning it. However, I expect
; there are performance reasons to prefer one over the other...
