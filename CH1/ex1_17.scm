(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (fast-multi b n)
  (cond ((= n 0) 0)
        ((even? n) (double (fast-multi b (halve n))))
        (else (+ b (fast-multi b (- n 1))))))
