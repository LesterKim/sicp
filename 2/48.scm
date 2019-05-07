(define make-vect cons)

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

; Example
(define v1 (make-vect .25 .75))
(define v2 (make-vect .5 .5))
(define s (make-segment v1 v2))

(start-segment s)
(end-segment s)