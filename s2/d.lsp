#!/bin/clisp

(defun ma-ta(l e e1 niv)
	(cond
		((and
			(and
				(atom l) (equal l e)
			)
			(= (mod niv 2) 1)
		)
		e1
		)
		((atom l) l)
		(t
			(mapcar #'(lambda (x)
					(ma-ta x e e1 (+ niv 1))
			)
			l
			)
		)
	)

)

(print
	(ma-ta '(1 d (d 2 (d 3)) 1 d d (d d d d (d d))) 'd 'f 0)
)
