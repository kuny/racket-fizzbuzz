#lang racket

(module+ main

  (for ([i (in-range 1 101)])
    (displayln
      (match (list (remainder i 3) (remainder i 5))
        ['(0 0) "FizzBuzz"]
        ['(0 _) "Fizz"]
        ['(_ 0) "Buzz"]
        [_      i])))

)

