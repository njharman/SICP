;; Norman J. Harman Jr. njharman@gmail.com
;; 2011 SICP MIT Open Courseware 6.001

;; 1.4 Observe that our model of evaluation allows for combinations whose
;;     operators are compound expressions. Use this observation to describe
;;     the behavior of the following procedure:


(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

;; Operator is not special.  Operators, Operands it's all just data it's code.


;; Tests
(asserteq "2+1" 3 (a-plus-abs-b 2 1))
(asserteq "2+-1" 3 (a-plus-abs-b 2 -1))
(asserteq "2+-8" 10 (a-plus-abs-b 2 -8))
(asserteq "-2+-2" 0 (a-plus-abs-b -2 -2))
