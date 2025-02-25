Extension { #name : #FmxMBBehavior }

{ #category : #'*Famix-Visitor' }
FmxMBBehavior >> behaviorsToVisit [

	| behaviorsToVisit |
	behaviorsToVisit := self allLocalTraits asOrderedCollection sorted:
		                    #name ascending.

	"Do not visit the traits that can be find higher in the hierarchy and in traits"
	behaviorsToVisit := behaviorsToVisit reject: [ :fmxMBTrait |
		                    self traitsFromGeneralizations includes:
			                    fmxMBTrait ].

	"Visit superclass if it is not #FamixXYZEntity"
	self classGeneralization ifNotNil: [ :superclass |
		superclass name = #Entity ifFalse: [
			behaviorsToVisit add: superclass ] ].

	^ behaviorsToVisit
]

{ #category : #'*Famix-Visitor' }
FmxMBBehavior >> traitsFromGeneralizations [

	self subclassResponsibility
]
