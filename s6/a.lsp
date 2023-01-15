#!/bin/clisp

(defun f(l)
	(cond
		((null l) 0)
		(t
			(lambda(x)
				(cond
					((> x 2)
						(+ (f cdr l) x))
					(t
						(+ x 1)
					)
				)
			)
			(f (car l))
		)
	)
)

(defun fo(l)
	(cond
		((null l) 0)
		((> (fo (car l)))
			(+ (fo (cdr l)) (fo (car l)))
		)
		(t
			(+ (fo (car l)) 1)
		)
	)
)

(print
	(f '(1 2 3 4))
)


(print
	(fo '(1 2 3 4))
)
