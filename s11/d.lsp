#!/bin/clisp

;D. Se consideră o listă neliniară.
;Să se scrie o funcţie LISP
;care să aibă ca rezultat lista
;iniţială din care au fost eliminaţi toţi
;atomii nenumerici de pe nivelurile pare
;(nivelul superficial se consideră 1).
;Se va folosi o funcție MAP.
;Exemplu pentru lista (a (1 (2 b)) (c (d)))
;rezultă (a (1 (2 b)) ((d)))

(defun f(l n)
	(cond
		(
			(numberp l) l
		)
		(
			(and
				(atom l)
				(=(mod n 2 ) 0)
			)
			nil
		)
		(
			(atom l) l
		)
		(t
			(funcall #'append
					(list
					(mapcar
					#'(lambda (x)
						(f x (+  1 n))
					)
					l
					)
					)
			)
		)
	)
)

(print
	(f '(a (1 (2 b)) (c (d))) 0)
)

(print
	(append nil '((d)))
)
