(define (transform-painter painter origin corner1 corner2)
	(lambda (frame)
		(let ((m (frame-coord-map frame)))
			(let ((new-origin (m origin)))
				(painter
					(make-frame new-origin
						(sub-vect (m corner1) new-origin)
						(sub-vect (m corner2) new-origin)))))))

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              (make-vect 0.0 1.0)
                              split-point))
          (paint-top
           (transform-painter painter2
                              split-point
                              (make-vect 1.0 0.5)
                              (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-bottom frame)
        (paint-top frame)))))