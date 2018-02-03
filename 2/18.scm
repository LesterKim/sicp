(define nil '())

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(define (reverse sequence)
  (define (reverse-iter a b)
  	(if (null? a)
  		b
  		(reverse-iter (cdr a) (cons (car a) b))))
  (reverse-iter sequence nil))


; Example
(reverse (list 1 4 9 16 25))