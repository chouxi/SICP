;; Newton's method square root
;; need to be 1.0 a float number otherwise it has problem
(define (sqrt x) (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (new-good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                  x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (abs x)
  (cond ((< x 0) (- x))
    (else x)))

;; not good for small number
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; not good for big number
(define (new-good-enough? guess x)
  (< (abs (- (improve guess x) guess)) (* guess 0.001)))
