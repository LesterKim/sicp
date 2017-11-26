(define (square n)
  (* n n))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
	(define (fe-iter a base power)
		(cond ((= power 0) a)
			  ((even? power) (fe-iter a (square base) (/ power 2)))
			  (else (fe-iter (* a base) base (- power 1)))))

	(fe-iter 1 b n))


(fast-expt 2 0)
(fast-expt 2 1)
(fast-expt 2 2)
(fast-expt 2 3)
(fast-expt 2 4)
(fast-expt 2 5)
(fast-expt 2 6)
(fast-expt 2 7)
(fast-expt 2 8)
(fast-expt 2 9)