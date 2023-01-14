#!/bin/clisp

(defun i(l e e1)
	(cond
		((and (atom l)
			(not (equal l e))
			)
		l
		)

		((and (atom l)
			(equal l e)
			)
		e1
		)

		(t
			(mapcar #'(lambda (x)
						(i x e e1)
						)
			l
			)
		)
	)
)


(print
	(i '(1 (2 A) A A) 'A 'B)
)
