Extension { #name : #FmxMBClass }

{ #category : #'*Famix-Visitor' }
FmxMBClass >> addTraitsFromGeneralizationsIn: aCollection [

	super addTraitsFromGeneralizationsIn: aCollection.

	self classGeneralization ifNotNil: [ :superclass |
		superclass addTraitsFromGeneralizationsIn: aCollection ].

	^ aCollection
]

{ #category : #'*Famix-Visitor' }
FmxMBClass >> behaviorsToVisit [

	| behaviorsToVisit |
	behaviorsToVisit := super behaviorsToVisit.

	"Visit superclass if it is not #FamixXYZEntity"
	self classGeneralization ifNotNil: [ :superclass |
		superclass name = #Entity ifFalse: [
			behaviorsToVisit add: superclass ] ].

	^ behaviorsToVisit
]

{ #category : #'*Famix-Visitor' }
FmxMBClass >> traitsFromGeneralizations [

	| traitsFromGeneralizations |
	traitsFromGeneralizations := super traitsFromGeneralizations.

	self classGeneralization ifNotNil: [ :superclass |
		superclass addTraitsFromGeneralizationsIn: traitsFromGeneralizations ].

	^ traitsFromGeneralizations
]
