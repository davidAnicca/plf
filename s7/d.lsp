#!/bin/clisp
;Se consideră o listă neliniară.
; Să se scrie o funcţie LISP care să
;aibă ca rezultat lista iniţială
; în care toate apariţiile unui
;element e au fost înlocuite cu o
;valoare e1 . Se va folosi o funcție MAP.
;Exemplu
;a) dacă lista este (1 (2 A (3 A)) (A))
	;e este A şi e1 este B => (1 (2 B (3 B)) (B))
;b) dacă lista este (1 (2 (3))) şi
	;e este A => (1 (2 (3)))

(defun i(arb e e1)
	(cond
		(
			(and
				(atom arb)
				(equal arb e)
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
						(i x e e1)
				)
				arb
			)
		)
	)
)


(print
	(i '(1 (2 A (3 A)) (A)) 'A 'B)
)
(print
	(i '(1 (2 A (3 A)) (A)) 'F 'B)
)
