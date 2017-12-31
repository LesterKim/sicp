; iterative accumulate
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))

  (iter a null-value))

; sum
(define (sum term a next b)
  (accumulate + 0 term a next b))

; product
(define (product term a next b)
  (accumulate * 1 term a next b))

; Test with factorial
(define (factorial n)
  (define (inc x) (+ 1 x))
  (define (identity x) x)

  (product identity 1 inc n))

(factorial 4)
