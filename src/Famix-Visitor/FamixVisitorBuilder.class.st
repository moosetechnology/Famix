Class {
	#name : #FamixVisitorBuilder,
	#superclass : #FamixVisitorCodeGenerator,
	#category : #'Famix-Visitor'
}

{ #category : #'instance creation' }
FamixVisitorBuilder class >> for: aFmxMBVisitorTrait [

	^ self new
		  visitorTrait: aFmxMBVisitorTrait;
		  yourself
]

{ #category : #'generating - visit' }
FamixVisitorBuilder >> computeBehaviorsToVisitIn: aFmxMBBehavior [

	| behaviorsToVisit |
	behaviorsToVisit := aFmxMBBehavior allLocalTraits asOrderedCollection
		                    sorted: #name ascending.

	"Do not visit the traits that can be find higher in the hierarchy and in traits"
	behaviorsToVisit := behaviorsToVisit reject: [ :fmxMBTrait |
		                    aFmxMBBehavior traitsFromGeneralizations
			                    includes: fmxMBTrait ].

	"Visit superclass if it is not #FamixXYZEntity"
	aFmxMBBehavior classGeneralization ifNotNil: [ :superclass |
		superclass name = #Entity ifFalse: [
			behaviorsToVisit add: superclass ] ].

	^ behaviorsToVisit
]

{ #category : #generating }
FamixVisitorBuilder >> generate [

	(visitorTrait builder classes reject: #isModelClass)
	, (visitorTrait builder traits reject: #isEntityCreatorTrait) do: [
		:fmxMBBehavior |
		self generateVisitMethodFor: fmxMBBehavior.
		self generateAcceptMethodIn: fmxMBBehavior ]
]

{ #category : #'generating - accept' }
FamixVisitorBuilder >> generateAcceptMethodIn: aFmxMBBehavior [

	aFmxMBBehavior builder environment
		compile: ('accept: aVisitor

	<generated>
	^ aVisitor visit{1}: self' format: { aFmxMBBehavior fullName })
		in: aFmxMBBehavior realClass
		classified: #visiting
		package: visitorTrait packageName
]

{ #category : #'generating - visit' }
FamixVisitorBuilder >> generateVisitMethodFor: aFmxMBBehavior [

	visitorTrait builder environment
		compile: (String streamContents: [ :s |
				 self writeVisitMethodFor: aFmxMBBehavior on: s ])
		in: visitorTrait realClass
		classified: #visiting
		package: visitorTrait packageName
]

{ #category : #accessing }
FamixVisitorBuilder >> visitorTrait: aFmxMBVisitorTrait [

	visitorTrait := aFmxMBVisitorTrait
]

{ #category : #'generating - visit' }
FamixVisitorBuilder >> writeVisitMethodFor: aFmxMBBehavior on: aStream [

	self writeVisitMethodHeaderFor: aFmxMBBehavior on: aStream.
	self writeVisitTraitsAndSuperclassFor: aFmxMBBehavior on: aStream.
	self writeVisitRelationsFor: aFmxMBBehavior on: aStream
]

{ #category : #'generating - visit' }
FamixVisitorBuilder >> writeVisitMethodHeaderFor: aFmxMBBehavior on: aStream [

	aStream <<('visit{1}: a{1}

	<generated>
' format: { aFmxMBBehavior fullName })
]

{ #category : #'generating - visit' }
FamixVisitorBuilder >> writeVisitRelationsFor: aFmxMBBehavior on: aStream [

	aFmxMBBehavior relations
		do: [ :relation |
			aStream << ('	self visit{1}: a{2} {3}' format: {
					 (relation side isOne
						  ifTrue: [ 'Entity' ]
						  ifFalse: [ 'Collection' ]).
					 aFmxMBBehavior fullName.
					 relation side name }) ]
		separatedBy: [
			aStream
				<< $.;
				cr ]
]

{ #category : #'generating - visit' }
FamixVisitorBuilder >> writeVisitTraitsAndSuperclassFor: aFmxMBBehavior on: aStream [

	(self computeBehaviorsToVisitIn: aFmxMBBehavior)
		do: [ :behavior |
			aStream
				tab;
				<< ('self visit{1}: a{2}' format: {
								 behavior fullName.
								 aFmxMBBehavior fullName }) ]
		separatedBy: [
			aStream
				<< $.;
				cr ]
]
