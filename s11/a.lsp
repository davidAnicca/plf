#!/bin/clisp

(defun f(l)
	(cond
		((null l) nil)
		(
			(listp (car l))
			(lambda (x)
				(append x (f (cdr l)) (car x))
				(f (car l))
			)
		)
		(t
			(list (car l))
		)
	)
)
