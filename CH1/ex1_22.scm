;; sqrt(n) method testing prime number
(define (square n) (* n n))
;; find divisor
(define (divides? a b) (= (remainder a b) 0))

(define (find-divisor n idx)
  (cond ((> (square idx) n) n)
        ((divides? n idx) idx)
        (else (find-divisor n (+ idx 1))))
)

;; if smallest divisor is the number itself it is prime
;; starting with 2
(define (prime? n) (= (find-divisor n 2) n))

;; If it's prime return 1 otherwise 0
(define (disp-prime n)
  (cond ((prime? n) (newline) (display n) 1)
        (else 0))
)

(define (first-primes start-num num)
  (define (inner_helper start-num num)
    (cond ((= num 0) 0)
          (else (inner_helper (+ start-num 2) (- num (disp-prime start-num)))))
  )
  (cond ((odd? start-num) (inner_helper (+ start-num 2) num))
        (else (inner_helper (+ start-num 1) num)))
)

(define (first-3-primes n) (first-primes n 3))

(define (start-test n start-time)
  (first-3-primes n)
  (report-time (- (runtime) start-time))
)

(define (report-time elapsed-time)
  (newline)
  (display " *** ")
  (display elapsed-time)
)

(define (time-test n)
  (newline)
  (start-test n (runtime))
)
