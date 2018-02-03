; (define (list-ref items n)
;   (if (= n 0)
;       (car items)
;       (list-ref (cdr items) (- n 1))))

; (define (length items)
;   (if (null? items)
;       0
;       (+ 1 (length (cdr items)))))

; (define (last-pair sequence)
;   (list (list-ref sequence (- (length sequence) 1))))

; (last-pair (list 23 72 149 34))

(define (scale-list items factor)
  (if (null? items)
      nil
      (cons (* (car items) factor)
            (scale-list (cdr items) factor))))

(scale-list (list 1 2 3 4 5) 10)