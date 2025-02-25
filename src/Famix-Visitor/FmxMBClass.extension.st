Extension { #name : #FmxMBClass }

{ #category : #'*Famix-Visitor' }
FmxMBClass >> addTraitsFromGeneralizationsIn: aCollection [

	self traitGeneralizations do: [ :trait |
		trait addTraitsFromGeneralizationsIn: aCollection ].

	self classGeneralization ifNotNil: [ :superclass |
		superclass addTraitsFromGeneralizationsIn: aCollection ].

	^ aCollection
]

{ #category : #'*Famix-Visitor' }
FmxMBClass >> traitsFromGeneralizations [

	| traitsFromGeneralizations |
	traitsFromGeneralizations := Set new.

	self traitGeneralizations do: [ :trait |
		trait addTraitsFromGeneralizationsIn: traitsFromGeneralizations ].
	self classGeneralization addTraitsFromGeneralizationsIn:
		traitsFromGeneralizations.

	^ traitsFromGeneralizations
]
