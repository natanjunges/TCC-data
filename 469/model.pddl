(define (domain pfl)
(:requirements :strips)
(:types object object - object object - object object - object object - object message - object i - message s - message b - message iq - message sq - message variable - object oi1 - variable oi2 - variable)
(:predicates
	(sent-to-human ?m1 - message)
	(sent-to-robot ?m1 - message)
	(set ?v1 - variable)
)

(:action goto-tr-pre
	:parameters (?oi2 - oi2 ?w - w)
	:precondition (and (set ?w) (not (set ?oi2)))
	:effect (and 
	)
)

(:action goto-tr
	:parameters (?oi1 - oi1 ?oi2 - oi2 ?w - w ?i - i)
	:precondition (and (set ?w) (not (sent-to-robot ?i)) (not (set ?oi2)))
	:effect (and 
		(set ?oi1)
		(sent-to-human ?i)
	)
)

(:action goto-rrc1-pre
	:parameters (?w1 - w1 ?w2 - w2)
	:precondition (and (set ?w1) (set ?w2))
	:effect (and 
		(not (set ?w1))
	)
)

(:action goto-rrc1
	:parameters (?oi - oi ?w1 - w1 ?w2 - w2 ?i - i ?iq - iq)
	:precondition (and (set ?oi) (sent-to-human ?i) (set ?w2) (not (sent-to-human ?iq)) (not (sent-to-robot ?i)))
	:effect (and 
		(sent-to-robot ?iq)
		(set ?w1)
		(not (sent-to-human ?i))
	)
)

(:action goto-rrc2-pre
	:parameters (?w - w)
	:precondition (and )
	:effect (and 
	)
)

(:action goto-rrc2
	:parameters (?oi1 - oi1 ?oi2 - oi2 ?w - w ?iq - iq)
	:precondition (and (sent-to-robot ?iq) (set ?w) (not (sent-to-human ?iq)))
	:effect (and 
		(set ?oi1)
		(not (sent-to-robot ?iq))
		(set ?oi2)
	)
)

(:action goto-cr
	:parameters (?oi1 - oi1 ?oi2 - oi2 ?b - b)
	:precondition (and (not (sent-to-robot ?b)))
	:effect (and 
		(set ?oi1)
		(sent-to-human ?b)
		(set ?oi2)
	)
)

(:action goto-cr-post
	:parameters (?b - b)
	:precondition (and (sent-to-human ?b) (not (sent-to-robot ?b)))
	:effect (and 
		(not (sent-to-human ?b))
	)
)

(:action goto-tw-pre
	:parameters (?w2 - w2)
	:precondition (and (set ?w2))
	:effect (and 
		(not (set ?w2))
	)
)

(:action goto-tw
	:parameters (?w1 - w1 ?w2 - w2 ?s - s)
	:precondition (and (set ?w1) (set ?w2) (not (sent-to-human ?s)))
	:effect (and 
		(sent-to-robot ?s)
	)
)

(:action goto-rwc1
	:parameters (?w - w ?s - s ?sq - sq)
	:precondition (and (sent-to-robot ?sq) (sent-to-robot ?s))
	:effect (and 
		(sent-to-human ?sq)
		(sent-to-human ?s)
		(not (sent-to-robot ?sq))
		(not (sent-to-robot ?s))
	)
)

(:action goto-rwc2
	:parameters (?w1 - w1 ?w2 - w2 ?sq - sq)
	:precondition (and (set ?w2) (sent-to-human ?sq))
	:effect (and 
		(not (sent-to-human ?sq))
		(sent-to-robot ?sq)
	)
)

(:action goto-cw1
	:parameters (?w1 - w1 ?w2 - w2 ?b - b)
	:precondition (and (sent-to-human ?b) (set ?w2))
	:effect (and 
		(set ?w1)
		(sent-to-robot ?b)
	)
)

(:action goto-cw1-post
	:parameters (?b - b)
	:precondition (and (sent-to-human ?b) (sent-to-robot ?b))
	:effect (and 
		(not (sent-to-human ?b))
		(not (sent-to-robot ?b))
	)
)

(:action goto-cw2-pre
	:parameters (?oi2 - oi2)
	:precondition (and (set ?oi2))
	:effect (and 
		(not (set ?oi2))
	)
)

(:action goto-cw2
	:parameters (?oi1 - oi1 ?oi2 - oi2 ?w - w)
	:precondition (and (set ?oi1))
	:effect (and 
		(set ?oi2)
	)
))