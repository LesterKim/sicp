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

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((a (* c (- 1 p)))
  	    (b (* c (+ 1 p))))
    (make-interval a b)))

(define (percent i)
  (let ((c (center i))
  		(w (width i)))
    (/ w c)))

; Example
(define ex (make-center-percent 2 .1))
(percent ex)