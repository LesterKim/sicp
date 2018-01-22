(define (div-interval x y)
  (if (= y 0)
  	  (error "y cannot be 0" y)
  	  (mul-interval x 
                    (make-interval (/ 1.0 (upper-bound y))
                               	   (/ 1.0 (lower-bound y))))))