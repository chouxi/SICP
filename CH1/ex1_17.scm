(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (fast-add b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (double b) (halve n)))
          (else (iter (+ a b) b (- n 1)))))
  (iter 0 b n))
