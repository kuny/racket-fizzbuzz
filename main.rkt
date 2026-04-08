#lang racket

(define-syntax modulo-zero?
  (syntax-rules ()
    [(modulo-zero? x n)
     (zero? (modulo x n))]))

(stream->list
  (stream-map (lambda (x)
                (cond ((modulo-zero? x 15) 'FizzBuzz)
                      ((modulo-zero? x 3) 'Fizz)
                      ((modulo-zero? x 5) 'Buzz)
                      (else x)))
              (in-range 1 101)))

