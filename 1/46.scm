(define (iterative-improve good-enough? improve)
  (lambda (guess)
  	(if (good-enough? guess)
  		guess
  		((iterative-improve good-enough? improve) (improve guess))
  		)))

(define tolerance 0.00001)
(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))

(define (sqrt x)
  (let ((good-enough? (lambda (guess) (< (abs (- (square guess) x)) tolerance)))
        (improve (lambda (guess) (average guess (/ x guess)))))
    ((iterative-improve good-enough? improve) 1.0)))

(define (fixed-point f first-guess)
  (let ((close-enough? (lambda (guess)
  	                           (< (abs (- guess (f guess))) tolerance))))
    ((iterative-improve close-enough? f) first-guess)))

(sqrt 2)
(fixed-point cos 1.0)