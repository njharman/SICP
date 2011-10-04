;; Norman J. Harman Jr. njharman@gmail.com
;; 2011 SICP MIT Open Courseware 6.001
;; Exercise 1.3.  Define a procedure that takes three numbers as arguments and
;;                returns the sum of the squares of the two larger numbers.


(define (doit a b c)
    (define (sumsquares x y)
        (+ (* x x) (* y y)))
    (define (>= x y)
        (cond
            ((> x y))
            ((= x y))
            (else '#f)))
    (cond
        ((and (>= a c) (>= b c)) (sumsquares a b))
        ((and (>= b a) (>= c a)) (sumsquares b c))
        ((and (>= c b) (>= a b)) (sumsquares a c))
        )
    )


;; Tests

(if (= 0 (doit 0 0 0)) #t #f)
(if (= 1 (doit 1 0 0)) #t #f)
(if (= 5 (doit 1 2 0)) #t #f)
(if (= 13 (doit 1 2 3)) #t #f)
(if (= 25 (doit 4 2 3)) #t #f)
(if (= 25 (doit 4 -5 3)) #t #f)
(if (= 8 (doit 2 2 2)) #t #f)
(if (= 8 (doit 0 2 2)) #t #f)
(if (= 8 (doit 2 0 2)) #t #f)
(if (= 8 (doit 2 2 0)) #t #f)
