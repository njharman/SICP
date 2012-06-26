;; simplistic unittest for scheme
;; stolen then mangled from http://c2.com/cgi/wiki?SchemeUnit


(define (reportmsg msg)
  (display msg)
  (newline))

(define (reporterr msg)
  (display "ERROR: ")
  (display msg)
  (newline)
  )

(define (reportpass msg)
  (string-append ".")
  )
(define (reportfail msg)
  (string-append "FAIL: " msg)
  )

(define (assert msg test)
  (if (not test)
    (reportfail msg)
    (reportpass msg)))

(define (asserteq msg a b)
  (assert msg (> 0.0001 (abs (- a b)))))

(define (test_fixture . tests)
  (display tests)
  )

;(test_fixture
; (asserteq "2+1" 3 '(a-plus-abs-b 2 1))
; (asserteq "2+1" 3 '(a-plus-abs-b 2 1))
; )
