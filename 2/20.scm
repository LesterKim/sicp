(define (same-parity x . y)
  (define (grow-list start new)
    (if (null? new)
        start
        (if (even? (- (car start) (car new)))
            (grow-list (append start (list (car new))) (cdr new))
            (grow-list start (cdr new)))))

  (grow-list (list x) y))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
