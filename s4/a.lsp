#!/bin/clisp

;(DEFUN F(N)
;	(COND
;		((= N 0) 0)
;		(> (F (- N 1)) 1) (- N 2))
;		(T (+ (F (- N 1)) 1))
;	)
;)

(defun f(n)
	(cond
		((= n 0) 0)
		(t
			((lambda (x)
				(cond
					((> x 1)
						(- n 2)
					)
					(t
						(+ x 1)
					)
				)
			)
				(f (- n 1))
			)
		)
	)
)
