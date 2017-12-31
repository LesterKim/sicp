(define dx 0.00001)
(define (square x) (* x x))
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (smooth f)
  (lambda (x)
    (let ((a (- x dx))
          (b (+ x dx)))
      (/ (+ (f a)
            (f x)
            (f b))
         3.0))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

((n-fold-smooth square 1) 2)
((n-fold-smooth square 2) 2)
((n-fold-smooth square 3) 2)
