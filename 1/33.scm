; setup for prime
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; gcd
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; filtered-accumulate
(define (filtered-accumulate filter combiner null-value term a next b)
  (define value
  	(cond ((filter a) (term a))
  		  (else null-value)))

  (if (> a b)
      null-value
      (combiner value
                (filtered-accumulate filter combiner null-value term (next a) next b))))

; increment
(define (inc x) (+ x 1))

; sum of squares of primes
(define (sum-prime a b)
  (define (square x) (* x x))

  (filtered-accumulate prime? + 0 square a inc b))

; product of integers i < n and gcd(n,i) = 1 (relatively prime to n)
(define (prod-prime n)
  (define (identity x) x)
  (define (rel-prime? a)
  	(= (gcd n a) 1))

  (filtered-accumulate rel-prime? * 1 identity 1 inc (- n 1)))


(sum-prime 1 5)
(sum-prime 1 6)

(prod-prime 8)