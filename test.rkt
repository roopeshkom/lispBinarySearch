#lang racket
;; Using lang racket module
;; Attempting to create classic number-guessing game in racket-lisp, which is implemented using binary search

;; These are my lower and higher bounds, with the correct answer being randomly chosen from within range at start
(define low 0)
(define high 99)
(define ans (random (+ high 1)))

;; This is my function for returning the midpoint between my current low and high bounds
(define (ret-middle)
  (quotient (+ low high) 2))

;; Checks to see if the guess is equal to the answer, and if not starts recursively calling functions
(define (guess mid)
  (if (equal? ans mid)
      ('My 'guess 'is mid)
      (rep mid)))

;; This fucntion is called whenever the guess does not evaluate to correct, and either calls higher() or lower()
(define (rep mid)
  (list ans mid)
  (if (> ans mid)
      (higher)
      (lower)))

;; This function is called when the guess is too low, increases the lower bound, and calls the guess function
(define (higher)
  (set! low (min high (add1 (ret-middle))))
  (guess (ret-middle)))

;; This function is called when the guess is too high, decreases the lower bound, and calls the guess function
(define (lower)
  (set! high (max low (sub1 (ret-middle))))
  (guess (ret-middle)))

;; This is the driver code that starts the guessing process
(guess (ret-middle))
