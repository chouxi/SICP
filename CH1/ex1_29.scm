;; sum helper
(define (sum a b f next)
  (if (> a b) 0 (+ (f a) (sum (next a) b f next))))

(define (round-even n) (if (odd? n) (+ n 1) n))

(define (plus n) (+ n 1))

(define (cube n) (* n n n))

(define (simpson-rule f a b n)
  (let ((round-n (round-even n)))
    (let ((h (/ (- b a) round-n)))
      (define (simpson-term k)
        ((lambda (x)
          (cond ((= k 0) x)
                ((= k round-n) x)
                ((odd? k) (* 4.0 x))
                (else (* 2.0 x))))
        (f (+ a (* k h)))))
      (* (/ h 3.0) (sum 0 round-n simpson-term plus)))))
