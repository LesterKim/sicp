(define (square x) (* x x))

; recursive cont-frac
(define (cont-frac n d k)
  (define (try a)
    (if (> a k)
        0
        (/ (n a)
           (+ (d a)
              (try (+ a 1))))))
  (try 1))

(define (tan-cf x k)
  (let ((N (lambda (i)
                   (if (< i 2)
                       x
                       (* -1 (square x))))))
    (cont-frac N
               (lambda (i) (- (* 2 i) 1))
               k)))

(tan-cf (/ 3.14 4) 10)
