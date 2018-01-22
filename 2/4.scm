(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

; Verify
(define x 0)
(define y 1)
(car (cons x y))
(cdr (cons x y))