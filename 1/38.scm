; recursive cont-frac
(define (cont-frac n d k)
  (define (try a)
    (if (> a k)
        0
        (/ (n a)
           (+ (d a)
              (try (+ a 1))))))
  (try 1))

(define (D i)
  (let ((q (quotient i 3))
        (r (remainder i 3)))
    (if (= r 2)
        (- i q)
        1))
   )

(cont-frac (lambda (i) 1.0)
           D
           10)
