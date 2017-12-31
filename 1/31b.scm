; iterative product
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))

  (iter a 1))

; test with example
(define (inc n) (+ n 1))
(define (identity x) x)
(define (factorial n)
  (product identity 1 inc n))

(factorial 4)