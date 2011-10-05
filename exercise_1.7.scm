;; Norman J. Harman Jr. njharman@gmail.com
;; 2011 SICP MIT Open Courseware 6.001
;; Exercise 1.7. The good-enough? test used in computing square roots will not
;;   be very effective for finding the square roots of very small numbers. Also,
;;   in real computers, arithmetic operations are almost always performed with
;;   limited precision. This makes our test inadequate for very large numbers.
;;   Explain these statements, with examples showing how the test fails for small
;;   and large numbers. An alternative strategy for implementing good-enough? is to
;;   watch how guess changes from one iteration to the next and to stop when the
;;   change is a very small fraction of the guess.  Design a square-root procedure
;;   that uses this kind of end test. Does this work better for small and large
;;   numbers?


(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
       guess
       (sqrt-iter (improve guess x)
                  x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (better-than-good-enough? prev guess)
  (< (abs (- prev guess)) (/ guess 100000)))

(define (bsqrt-iter guess x)
  (define new (improve guess x))
  (if (better-than-good-enough? guess new)
       guess
       (bsqrt-iter new
                   x)))

(define (csqrt-iter guess x)
  (define test? (if (< x 1)
                    (lambda (prev guess x) (better-than-good-enough? prev guess))
                    (lambda (prev guess x) (good-enough? guess x))))
  (define (real-iter guess x)
    (define new (improve guess x))
    (if (test? guess new x)
        new
        (real-iter new x)))
  (real-iter guess x))


;; Tests

;; Worse for big numbers
(define big 999999999123)
(bsqrt-iter 1.0 (* big big))
; 1000000044920.3844
(sqrt-iter 1.0 (* big big))
; 999999999123

;; better for small numbers
(define small .002)
(bsqrt-iter 1.0 (* small small))
; 2.0000003065983023e-3
(sqrt-iter 1.0 (* small small))
; .03129261341049664

;; awesome for all numbers
(csqrt-iter 1.0 (* big big))
(csqrt-iter 1.0 (* small small))
