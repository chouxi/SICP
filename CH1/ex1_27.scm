(define (square n) (* n n))

(define (expmod base e m)
  (cond ((= e 0) 1)
        ((even? e) (remainder (square (expmod base (/ e 2) m)) m))
        (else (remainder (* base (expmod base (- e 1) m)) m))))

(define (fermat-prime n)
  (define (fermat-inner n a)
    (cond ((= a 1) #t)
          ((= (expmod a n n) a) (fermat-inner n (- a 1)))
          (else #f)))
  (fermat-inner n (- n 1)))
