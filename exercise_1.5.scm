;; Norman J. Harman Jr. njharman@gmail.com
;; 2011 SICP MIT Open Courseware 6.001

;; 1.5. Ben Bitdiddle has invented a test to determine whether the
;;      interpreter he is faced with is using applicative-order evaluation
;;      or normal-order evaluation. He defines the following two procedures:

(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;; yeah stuff

;; Tests
