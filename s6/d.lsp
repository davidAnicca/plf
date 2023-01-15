#!/bin/clisp

(defun f(l nivc k)
	(cond
		(
			(and
				(atom l)
				(= nivc k)
			)
		0)

		(
			(atom l)
			l
		)

		(t
			(mapcar
				#'(lambda (x)
					(f x (+ nivc 1) k)
				)
			l
			)
		)
	)
)


(print
	(f '(a (1 (2 b)) (c (d))) 0 2)
)


(print
	(f '(a (1 (2 b)) (c (d))) 0 1)
)


(print
	(f '(a (1 (2 b)) (c (d))) 0 4)
)
