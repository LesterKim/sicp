(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) .001))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (cbrt-iter (improve guess x)
                     x)))

(cbrt-iter 1.0 8)