(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

; Constructor
(define (make-interval a b) (cons a b))

; Selectors
(define (lower-bound interval)
  (if (< (car interval) (cdr interval))
  	  (car interval)
  	  (cdr interval)))
(define (upper-bound interval)
  (if (< (car interval) (cdr interval))
  	  (cdr interval)
  	  (car interval)))

(define (width x)
  (/ (- (upper-bound x)
  		(lower-bound x))
  	 2))

(define (sum-width x y)
  (width (make-interval (+ (lower-bound x) (lower-bound y))
                        (+ (upper-bound x) (upper-bound y)))))

(define (sum-width-2 x y)
  (+ (width x) (width y)))

; Examples
(define ex (make-interval 1 3))
(define ey (make-interval 2 4))
(sum-width ex ey)
(sum-width-2 ex ey)
(width (sub-interval ex ey))
(width (mul-interval ex ey))
(width (div-interval ex ey))