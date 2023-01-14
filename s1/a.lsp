#!/bin/clisp

(defun F (L1 L2)
	(cond
	((null L1) L2)
	(T (append (list (f (car L1) L2)) (f (cdr L1) L2)))
)
)

(print
	(f '(((((()))))) '(2 3 2))
)
