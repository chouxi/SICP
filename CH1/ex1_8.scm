;; Newton's method cube root

(define (cube-root x) (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
                  x)))

(define (improve guess x)
  (average (/ x (square guess)) (* guess 2)))

(define (average x y)
  (/ (+ x y) 3))

(define (cube x) (* x (square x)))

(define (square x) (* x x))

(define (abs x)
  (cond ((< x 0) (- x))
    (else x)))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))
