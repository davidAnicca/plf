#!/bin/clisp

(defun nod(arb niv ndat)
	(cond
		(
			(and
				(and
					(atom arb)
					(equal ndat arb)
				)
				(= (mod niv 2) 0)
			)
		(list t))

		((atom arb)
		nil
		)

		(t
			(apply #'append
			(mapcar
				#'(lambda (x)
						(nod x (+ niv 1) ndat)
				)
			arb
			)
			)
		)
	)
)


(print
	(nod '(a (b (g)) (c (d (e)) (f))) -1 'b)
)
