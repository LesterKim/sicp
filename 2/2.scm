(define (average a b) (/ (+ a b) 2.0))

; Points
(define (make-point x y)
  (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

; Segments
(define (make-segment start end)
  (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (midpoint-segment segment)
  (make-point (average (x-point (start-segment segment))
  					   (x-point (end-segment segment)))
			  (average (y-point (start-segment segment))
			  		   (y-point (end-segment segment)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Example
(define ex-seg
  (make-segment (make-point 0 0) (make-point 1 1)))
(print-point (midpoint-segment ex-seg))