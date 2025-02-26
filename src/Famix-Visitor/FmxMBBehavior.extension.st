Extension { #name : #FmxMBBehavior }

{ #category : #'*Famix-Visitor' }
FmxMBBehavior >> addTraitsFromGeneralizationsIn: aCollection [

	self traitGeneralizations do: [ :trait |
		trait addTraitsFromGeneralizationsIn: aCollection ].

	^ aCollection
]

{ #category : #'*Famix-Visitor' }
FmxMBBehavior >> behaviorsToVisit [
	"Do not visit the traits that can be found higher in the hierarchy and in traits"

	^ self allLocalTraits asOrderedCollection
	  \ self traitsFromGeneralizations sorted: #fullName ascending
]

{ #category : #'*Famix-Visitor' }
FmxMBBehavior >> traitsFromGeneralizations [

	| traitsFromGeneralizations |
	traitsFromGeneralizations := Set new.

	self traitGeneralizations do: [ :trait |
		trait addTraitsFromGeneralizationsIn: traitsFromGeneralizations ].

	^ traitsFromGeneralizations
]
