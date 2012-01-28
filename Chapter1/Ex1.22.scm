#! /usr/bin/guile -s
!#
; coding: utf-8
(load "Ex1.21.scm")

(use-modules (srfi srfi-19))
(define (runtime)
  (let ((time (current-time)))
    (/ (+ (* 1e9 (time-second time))
          (time-nanosecond time))
       1000)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes min max)
  (define (smallest-odd n)
    (if (odd? n) n (+ n 1)))
  (define (search-for-primes-iter min max)
    (if (< min max)
        ((lambda () 
           (timed-prime-test min)
           (search-for-primes-iter (+ min 2) max)))))
  (search-for-primes-iter (smallest-odd min) max))
