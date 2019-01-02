;; recursive version
(define (fib_like_recur n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        ((= n 2) 2)
        (else (+
          (+ (fib_like_recur (- n 1)) (* 2 (fib_like_recur (- n 2))))
          (* 3 (fib_like_recur (- n 3)))))))

;; iterative version
(define (fib_like_iter n)
  (iter_helper 0 1 2 n))

(define (iter_helper a b c n)
  (if (= n 0)
    a
    (iter_helper b c (+ (+ (* 3 a) (* 2 b)) c) (- n 1))))
