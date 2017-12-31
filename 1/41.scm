(define (inc x) (+ x 1))

(define double
  (lambda (f)
          (lambda (x) (f (f x)))))

(((double double) inc) 5)
(((double (double double)) inc) 5)
