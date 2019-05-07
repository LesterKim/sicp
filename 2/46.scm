(define make-vect cons)

(define xcor-vect car)
(define ycor-vect cdr)

(define (add-vect v1 v2)
	(make-vect (+ (xcor-vect v1) (xcor-vect v2))
			   (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
	(make-vect (- (xcor-vect v1) (xcor-vect v2))
			   (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
	(make-vect (* s (xcor-vect v))
			   (* s (ycor-vect v))))

; Example
(define v (make-vect .25 .75))
(define v2 (make-vect .5 .5))

(add-vect v v2)
(sub-vect v v2)
(scale-vect 4 v)