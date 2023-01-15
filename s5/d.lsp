#!/bin/clisp
;Să se substituie un element
;e prin altul e1 la orice nivel
;impar al unei liste neliniare.
;Nivelul superficial se consideră 1.
;De exemplu, pentru lista (1 d (2 d (d))),
;e =d şi e1 =f rezultă lista (1 f (2 d (f))).

(defun f(arb niv e e1)
	(cond
		(
			(and
				(and
					(atom arb)
					(equal arb e)
				)
				(= (mod niv 2) 1)
			)
			e1
		)
		(
			(atom arb)
			arb
		)

		(t
			(mapcar
				#'(lambda
						(x)
						(f x (+ niv 1) e e1)
				)
				arb
			)
		)
	)
)

(print
	(f '(1 d (2 d (d))) 0 'd 'xan)
)
