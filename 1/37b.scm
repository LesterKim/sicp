; recursive cont-frac
(define (cont-frac n d k)
  (define (try a)
    (if (> a k)
        0
        (/ (n a)
           (+ (d a)
              (try (+ a 1))))))
  (try 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
