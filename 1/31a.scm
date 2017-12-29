; product
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; factorial
(define (factorial n)
  (define (inc x) (+ 1 x))
  (define (identity x) x)

  (product identity 1 inc n))


; pi-prod
(define (pi-prod a b)
  (define (square x) (* x x))
  (define (inc-2 x) (+ 2 x))
  (define (pi-term x)
      (/ (* x
            (+ x 2.0))
         (square (+ x 1))))

  (product pi-term a inc-2 b))


(factorial 4)

(* 4 (pi-prod 2 1000))
