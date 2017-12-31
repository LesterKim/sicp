; iternative cont-frac
(define (cont-frac n d k)
  (define (iter a result)
    (if (> a k)
        result
        (iter (+ 1 a)
              (/ (n a) (+ (d a) result)))))
  (iter 1 0.0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
