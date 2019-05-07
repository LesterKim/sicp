(define make-vect cons)

(define (add-vect v1 v2)
	(make-vect (+ (xcor-vect v1) (xcor-vect v2))
			   (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
	(make-vect (- (xcor-vect v1) (xcor-vect v2))
			   (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
	(make-vect (* s (xcor-vect v))
			   (* s (ycor-vect v))))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

; a
(define s1 (make-segment (make-vect 0 0) (make-vect 0 1)))
(define s2 (make-segment (make-vect 0 1) (make-vect 1 1)))
(define s3 (make-segment (make-vect 1 1) (make-vect 1 0)))
(define s4 (make-segment (make-vect 1 0) (make-vect 0 0)))

(define segment-list1 (list s1 s2 s3 s4))
(define outline (segments->painter segment-list1))

; b
(define s1 (make-segment (make-vect 0 0) (make-vect 1 1)))
(define s2 (make-segment (make-vect 0 1) (make-vect 1 0)))

(define segment-list2 (list s1 s2))
(define x (segments->painter segment-list2))

; c
(define s1 (make-segment (make-vect 0 .5) (make-vect .5 0)))
(define s2 (make-segment (make-vect .5 0) (make-vect 1 .5)))
(define s3 (make-segment (make-vect 1 .5) (make-vect .5 1)))
(define s4 (make-segment (make-vect .5 1) (make-vect 0 .5)))

(define segment-list3 (list s1 s2 s3 s4))
(define diamond (segments->painter segment-list3))