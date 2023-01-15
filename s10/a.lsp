#!/bin/clisp

(defun fct(f l)
	(cond
		((null l) nil)
		(t
			(lambda (x)
				(cond
					(x
						(cons x (fct f (cdr l)))
					)
					(t nil)
				)
			(funcall f (car l)))
		)
	)
)
