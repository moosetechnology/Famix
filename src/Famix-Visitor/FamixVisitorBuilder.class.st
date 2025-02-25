Class {
	#name : #FamixVisitorBuilder,
	#superclass : #FamixExtensionMetamodelBuilder,
	#instVars : [
		'visitorTrait'
	],
	#category : #'Famix-Visitor'
}

{ #category : #default }
FamixVisitorBuilder >> defaultConfigurationClass [

	^ FamixMBVisitorConfiguration
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

{ #category : #generating }
FamixVisitorBuilder >> generateMethods [

	(visitorTrait builder classes reject: #isModelClass)
	, (visitorTrait builder traits select: #isMetamodelTrait) do: [
		:fmxMBBehavior |
		self generateVisitMethodFor: fmxMBBehavior.
		self generateAcceptMethodIn: fmxMBBehavior ]
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

{ #category : #'generating - trait' }
FamixVisitorBuilder >> newVisitorTrait [

	visitorTrait := FmxMBVisitorTrait new.
	visitorTrait builder: metamodelBuilder.

	visitorTrait prefix: metamodelBuilder configuration prefix.
	visitorTrait packageName: self configuration packageName.

	metamodelBuilder traits add: visitorTrait.
	visitorTrait generate
]

{ #category : #generating }
FamixVisitorBuilder >> prepareGeneration [

	self newVisitorTrait.
	self generateMethods
]

{ #category : #generating }
FamixVisitorBuilder >> registerPackages [

	metamodelBuilder environment registerPackage:
		self configuration packageName
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

	aFmxMBBehavior behaviorsToVisit
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
