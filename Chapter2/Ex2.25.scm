; guile> (define x (list 1 3 (list 5 7) 9))
; guile> x
; (1 3 (5 7) 9)
; guile> (car (cdr (car (cdr (cdr x)))))

; guile> (define x (list (list 7)))
; guile> x
; ((7))
; guile> (car (car x))
; 7

; guile> (define x (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
; guile> x
; (1 (2 (3 (4 (5 (6 7))))))
; guile> (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr x))))))))))))
; 7
