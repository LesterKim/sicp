(define (split pf ps)
	((lambda (x) (x x))
		(lambda (f)
			(lambda (painter n)
				(if (= n 0)
					painter
					(let ((smaller ((f f) painter (- n 1))))
						(pf painter (ps smaller smaller))))))))

;(define right-split (split beside below))
;(define up-split (split below beside))