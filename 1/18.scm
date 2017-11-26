(define (double n)
  (+ n n))

(define (halve a)
  (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-* l r)
	(define (f*-iter a b multiple)
		(cond ((= multiple 0) a)
  			  ((even? multiple) (f*-iter a (double b) (halve multiple)))
  			  (else (f*-iter (+ a b) b (- multiple 1)))))

	(f*-iter 0 l r))

(fast-* 2 10)