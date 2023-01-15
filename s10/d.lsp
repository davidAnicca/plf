#!/bin/clisp

;Să se substituie valorile numerice
; cu o valoare e dată, la orice nivel
; al unei liste neliniare.
;Se va folosi o funcție MAP.

(defun f(l e)
	(cond
		((numberp l)e)
		((atom l)l)
		(t
			(mapcar
				#'(lambda (x)
					(f x e)
				)
				l
			)
		)
	)
)

(print
	(f '(1 d (2 f (3))) 0)
)
