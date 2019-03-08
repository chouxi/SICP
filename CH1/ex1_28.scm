(define (squre n) (* n n))

;; a != 1
;; a != n - 1
;; a^2 mod n == 1
(define (non-trivial-sqrt? a n)
  (cond ((= a 1) #f)
        ((= a (- n 1)) #f)
        (else (= (remainder (square a) n) 1))))

(define (expmod base e m)
  (cond ((= e 0) 1)
        ((even? e)
          (let ((x (expmod base (/ e 2) m)))
          (if (non-trivial-sqrt? x m) 0
            (remainder (square x) m))))
        (else (remainder (* base (expmod base (- e 1) m)) m))))

;; Check all a < n
(define (miller-rabin-test n)
  (define (miller-rabin-inner n a)
    (cond ((= a 1) #t)
          ((= (expmod a n n) a) (miller-rabin-inner n (- a 1)))
          (else #f)))
  (miller-rabin-inner n (- n 1)))
