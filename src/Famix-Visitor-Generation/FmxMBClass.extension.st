Extension { #name : 'FmxMBClass' }

{ #category : '*Famix-Visitor-Generation' }
FmxMBClass >> addTraitsFromGeneralizationsIn: aCollection [

	super addTraitsFromGeneralizationsIn: aCollection.

	self superclass ifNotNil: [ :superclass |
		superclass addTraitsFromGeneralizationsIn: aCollection ].

	^ aCollection
]

{ #category : '*Famix-Visitor-Generation' }
FmxMBClass >> behaviorsToVisit [

	| behaviorsToVisit |
	behaviorsToVisit := super behaviorsToVisit.

	"Visit superclass if it is not #FamixXYZEntity"
	self superclass ifNotNil: [ :superclass |
		superclass name = #Entity ifFalse: [
			behaviorsToVisit add: superclass ] ].

	^ behaviorsToVisit
]

{ #category : '*Famix-Visitor-Generation' }
FmxMBClass >> traitsFromGeneralizations [

	| traitsFromGeneralizations |
	traitsFromGeneralizations := super traitsFromGeneralizations.

	self superclass ifNotNil: [ :superclass |
		superclass addTraitsFromGeneralizationsIn: traitsFromGeneralizations ].

	^ traitsFromGeneralizations
]
