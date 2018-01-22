(define (square x) (* x x))

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

; Length
(define (segment-length segment)
  (let ((x-diff (- (x-point (start-segment segment))
  				   (x-point (end-segment segment))))
  		(y-diff (- (y-point (start-segment segment))
  				   (y-point (end-segment segment)))))
    (sqrt (+ (square x-diff) (square y-diff)))))

; Rectangles
(define (make-rect hgt wdt)
  (cons hgt wdt))
(define (rect-height rectangle)
  (car rectangle))
(define (rect-width rectangle)
  (cdr rectangle))



(define (rect-height rectangle)
  (segment-length (car rectangle)))
(define (rect-width rectangle)
  (segment-length (cdr rectangle)))

; Perimeter
(define (perimeter rectangle)
  (* 2 (+ (rect-height rectangle)
  	 	  (rect-width rectangle))))

; Area
(define (area rectangle)
  (* (rect-height rectangle)
     (rect-width rectangle)))

; Example
(define ex-rect
  (make-rect (make-segment (make-point 0 0)
  						   (make-point 0 1))
  			 (make-segment (make-point 0 0)
  						   (make-point 2 0))))
(perimeter ex-rect)
(area ex-rect)