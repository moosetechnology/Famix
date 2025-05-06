"
I am responsible for the generation of a visitor trait when generating a Famix metamodel.
See `FamixVisitorGenerator`.
"
Class {
	#name : #FmxMBVisitorTrait,
	#superclass : #FmxMBTrait,
	#category : #'Famix-Visitor-Generation-MetamodelBuilder'
}

{ #category : #generating }
FmxMBVisitorTrait >> acceptMethodProtocol [

	^ self packageName == self builder configuration packageName
		  ifTrue: [ #visitor ]
		  ifFalse: [ '*' , self packageName ]
]

{ #category : #accessing }
FmxMBVisitorTrait >> comment [

	^ 'I am a visitor for {1}Entities. 
I am generated with the metamodel.' format: { self prefix }
]

{ #category : #generating }
FmxMBVisitorTrait >> generate [

	| aTrait |
	self willGenerate ifFalse: [ ^ self ].

	self builder environment registerPackage: self packageName.

	aTrait := self builder environment
		          createTraitNamed: self fullName asSymbol
		          uses: self allTraitNames
		          slots: self slotDefinitions
		          in: self packageName
		          overwrite: true.

	self builder environment setComment: self comment for: aTrait.

	aTrait tagWith: self tag.
	self realClass: aTrait.

	self generateAnnotationIn: aTrait superclass: nil.
	self generateCommonMethodsIfNecessary.
	self generateVisitAndAcceptMethods.
]

{ #category : #generating }
FmxMBVisitorTrait >> generateAcceptMethodIn: aFmxMBBehavior [

	self builder environment
		compile: ('accept: aVisitor

	<generated>
	^ aVisitor visit{1}: self' format: { aFmxMBBehavior fullName })
		in: aFmxMBBehavior realClass
		classified: self acceptMethodProtocol
]

{ #category : #'generation - common' }
FmxMBVisitorTrait >> generateCommonMethodsIfNecessary [

	self allLocalTraits ifNotEmpty: [ ^ self ].

	self generateVisitEntityMethod.
	self generateVisitCollectionMethod
]

{ #category : #generating }
FmxMBVisitorTrait >> generateVisitAndAcceptMethods [

	(builder classes reject: [ :fmxMBClass |
		 fmxMBClass isModelClass or: [ fmxMBClass isMetamodelClassGroup ] ])
	, (builder traits select: [ :fmxTrait |
			 fmxTrait isMetamodelTrait and: [ fmxTrait isVisitorTrait not ] ])
		do: [ :fmxMBBehavior |
			self generateVisitMethodFor: fmxMBBehavior.
			self generateAcceptMethodIn: fmxMBBehavior ]
]

{ #category : #'generation - common' }
FmxMBVisitorTrait >> generateVisitCollectionMethod [

	self realClass
		compile: 'visitCollection: aCollection

	<generated>
	^ aCollection collect: [ :each | each accept: self ]'
		classified: #visiting
]

{ #category : #'generation - common' }
FmxMBVisitorTrait >> generateVisitEntityMethod [

	self realClass
		compile: 'visitEntity: aFamixEntity

	<generated>
	^ aFamixEntity ifNotNil: [ aFamixEntity accept: self ]'
		classified: #visiting
]

{ #category : #'generation - visit' }
FmxMBVisitorTrait >> generateVisitMethodFor: aFmxMBBehavior [

	self builder environment
		compile: (String streamContents: [ :s |
				 self writeVisitMethodFor: aFmxMBBehavior on: s ])
		in: self realClass
		classified: #visiting
]

{ #category : #initialization }
FmxMBVisitorTrait >> initialize [

	super initialize.
	name := #TVisitor.
	tag := 'Trait'
]

{ #category : #testing }
FmxMBVisitorTrait >> isVisitorTrait [

	^ true
]

{ #category : #'generation - visit' }
FmxMBVisitorTrait >> writeTransitionFor: aFmxMBBehavior on: aStream [

	aFmxMBBehavior relations ifNotEmpty: [
		aStream
			<< $.;
			cr;
			cr ]
]

{ #category : #'generation - visit' }
FmxMBVisitorTrait >> writeVisitMethodFor: aFmxMBBehavior on: aStream [

	self writeVisitMethodHeaderFor: aFmxMBBehavior on: aStream.
	self writeVisitTraitsAndSuperclassFor: aFmxMBBehavior on: aStream.
	self writeVisitRelationsFor: aFmxMBBehavior on: aStream
]

{ #category : #'generation - visit' }
FmxMBVisitorTrait >> writeVisitMethodHeaderFor: aFmxMBBehavior on: aStream [

	aStream <<('visit{1}: a{1}

	<generated>
' format: { aFmxMBBehavior fullName })
]

{ #category : #'generation - visit' }
FmxMBVisitorTrait >> writeVisitRelationsFor: aFmxMBBehavior on: aStream [

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

{ #category : #'generation - visit' }
FmxMBVisitorTrait >> writeVisitTraitsAndSuperclassFor: aFmxMBBehavior on: aStream [

	aFmxMBBehavior behaviorsToVisit
		do: [ :behavior |
			aStream << ('	self visit{1}: a{2}' format: {
							 behavior fullName.
							 aFmxMBBehavior fullName }) ]
		separatedBy: [
			aStream
				<< '.';
				cr ];
		ifNotEmpty: [ self writeTransitionFor: aFmxMBBehavior on: aStream ]
]
