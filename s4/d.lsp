#!/bin/clisp

(defun exista(arb ndat)
	(cond
		((and
			(atom arb)
			(equal arb ndat)
		)
		'(t))
		((atom arb) nil)
		(t
			(apply #'append (mapcar #'(lambda(x)
				(exista x ndat)
			)
			arb
			)
			)
		)
	)
)

(defun cale(arb ndat)
	(cond
		(
			(and
				(atom arb)
				(equal arb ndat)
			)
			arb
		)
		((atom arb) nil)
		(
			(and
				(listp arb)
				(exista arb ndat)
			)
			(append (list (car arb))
			(mapcan #'(lambda (x)
						(cale x ndat)
						)
			arb
			)
			)
		)
	)
)

(print
	(cale '(a (b (g)) (c (d (e)) (f))) 'd)
)
