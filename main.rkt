#lang racket

(stream->list
  (stream-map (lambda (x)
                (cond ((zero? (modulo x 15)) 'FizzBuzz)
                      ((zero? (modulo x 3)) 'Fizz)
                      ((zero? (modulo x 15)) 'Buzz)
                      (else x)))
              (in-range 1 101)))

