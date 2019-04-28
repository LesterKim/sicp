(define (logb base n)
	(if (= n 1)
		0
		(+ (logb base (/ n base)) 1)))

(define (even? n)
	(= (modulo n 2) 0))

(define (cons x y)
	(* (expt 2 x) (expt 3 y)))

(define (car n)
	(if (even? n)
		(+ 1 (car (/ n 2)))
		0))

(define (cdr n)
	(if (= (modulo n 3) 0) ; mult of 3
		(+ 1 (cdr (/ n 3)))
		0))

; Verify
(car (cons 5 4))
(cdr (cons 5 4))