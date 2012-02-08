(use-modules (srfi srfi-19))

(define (runtime)
  (let ((time (current-time)))
    (/ (+ (* 1e9 (time-second time))
          (time-nanosecond time))
       1000)))

(define (with-time op)
  (lambda args
    (let ((start (runtime)))
      (let ((result (apply op args)))
        (cons result (- (runtime) start))))))

(define (time-it op)
  (lambda args
    (cdr (apply (with-time op) args))))
