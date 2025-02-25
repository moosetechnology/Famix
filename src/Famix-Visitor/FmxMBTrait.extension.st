Extension { #name : #FmxMBTrait }

{ #category : #'*Famix-Visitor' }
FmxMBTrait >> addTraitsFromGeneralizationsIn: aCollection [

	self traitGeneralizations do: [ :trait |
		trait addTraitsFromGeneralizationsIn: aCollection ].

	^ aCollection
]

{ #category : #'*Famix-Visitor' }
FmxMBTrait >> traitsFromGeneralizations [

	| traitsFromGeneralizations |
	traitsFromGeneralizations := Set new.

	self traitGeneralizations do: [ :trait |
		trait addTraitsFromGeneralizationsIn: traitsFromGeneralizations ].

	^ traitsFromGeneralizations
]
