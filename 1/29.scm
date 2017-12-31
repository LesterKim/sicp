(define (cube x)
	(* x x x))

(define ((inc n) x)
	(+ n x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
	(define h (/ (- b a) n))
	(define (y-k k) (f (+ a (* h k))))
	(* (+ (sum y-k 0 (inc 1) n)
		  (sum y-k 1 (inc 1) (- n 1))
		  (* 2 (sum y-k 1 (inc 2) (- n 1))))
	   (/ h 3)))

(simpson cube 0 1 100.0)
(simpson cube 0 1 1000.0)