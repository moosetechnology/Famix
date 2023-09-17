"
A FamixUMLDocumentorTest is a test class for testing the behavior of FamixUMLDocumentor
"
Class {
	#name : #FamixUMLDocumentorTest,
	#superclass : #TestCase,
	#instVars : [
		'documentor'
	],
	#category : #'Famix-UMLDocumentor-Tests-Generation'
}

{ #category : #running }
FamixUMLDocumentorTest >> mockModel: modelName classes: aCollection [

	| mockModel |
	mockModel := Mock named: modelName.
	mockModel stub metamodel willReturn: mockModel.
	mockModel stub classes willReturn: aCollection.
	(mockModel stub descriptionOf: Any ifAbsent: Any)
		will: [ :entity :block | (aCollection includes: entity) ifTrue: [ entity ] ifFalse: [ block value ] ].
	^mockModel

]

{ #category : #running }
FamixUMLDocumentorTest >> setUp [
	super setUp.

	documentor := FamixUMLDocumentor new
]

{ #category : #tests }
FamixUMLDocumentorTest >> testBeWithStub [

	| fmClass |
	fmClass := FDModel metamodel fmTypeOf: FDTrait3.

	documentor model: FDModel.
	documentor fmClasses: { fmClass }.
	documentor beWithStub.

	documentor generateClass: fmClass.

	self assert: documentor isWithStub.
	self assert: documentor umlEntities size equals: 3.

	self assert: (documentor umlEntities count: [ :e | e class = FamixUMLClass]) equals: 2.
	self assert: (documentor umlEntities count: [ :e | e class = FamixUMLUse]) equals: 1.
]

{ #category : #tests }
FamixUMLDocumentorTest >> testBeWithoutStub [

	| fmClass umlClass |
	fmClass := FDModel metamodel fmTypeOf: FDTrait2.

	documentor model: FDModel.
	documentor fmClasses: { fmClass }.
	documentor beWithoutStub.

	documentor generateClass: fmClass.

	self deny: documentor isWithStub.
	self assert: documentor umlEntities size equals: 1.

	umlClass := documentor umlEntities anyOne.
	self assert: umlClass name equals: 'Trait2'
]

{ #category : #tests }
FamixUMLDocumentorTest >> testColorForEntity [

	documentor model: FDModel.
	documentor model: FamixStModel.

	documentor fmClasses: (documentor getClassesFromModels).

	self
		assert: (documentor colorForEntity: (FDModel metamodel fmTypeOf: FDTrait1))
		equals: (documentor modelColors first value).
	self
		assert: (documentor colorForEntity: (FamixStModel metamodel fmTypeOf: FamixStClass))
		equals: (documentor modelColors second value).
]

{ #category : #tests }
FamixUMLDocumentorTest >> testGenerateClass [

	| fmClass umlClass |
	fmClass := FDModel metamodel fmTypeOf: FDModel.

	documentor model: FDModel color: Color red.
	documentor fmClasses: { fmClass }.
	documentor generateClass: fmClass.

	self assert: documentor umlEntities size equals: 1.

	umlClass := documentor umlEntities anyOne.
	self assert: umlClass name equals: 'FDModel'.
	self assert: umlClass color equals: Color red.
	self deny: umlClass isTrait
]

{ #category : #tests }
FamixUMLDocumentorTest >> testGenerateTrait [

	| fmClass umlClass |
	fmClass := FDModel metamodel fmTypeOf: FDTrait1.

	documentor model: FDModel color: Color red.
	documentor fmClasses: { fmClass }.
	documentor generateClass: fmClass.

	self assert: documentor umlEntities size equals: 1.

	umlClass := documentor umlEntities anyOne.
	self assert: umlClass name equals: 'Trait1'.
	self assert: umlClass color equals: Color red.
	self assert: umlClass isTrait
]

{ #category : #tests }
FamixUMLDocumentorTest >> testModel [

	self assert: documentor modelColors size equals: 0.

	documentor model: #aModel.

	self assert: documentor modelColors size equals: 1.
	self assert: documentor modelColors anyOne key equals: #aModel.
	self assert: documentor modelColors anyOne value equals: Color white.
]

{ #category : #tests }
FamixUMLDocumentorTest >> testModelColor [

	documentor model: #aModel color: Color red.

	self assert: documentor modelColors anyOne value equals: Color red.
]

{ #category : #tests }
FamixUMLDocumentorTest >> testSeveralModels [

	self assert: documentor modelColors size equals: 0.

	documentor model: #model1.
	self assert: documentor modelColors size equals: 1.

	documentor model: #model2.
	self assert: documentor modelColors size equals: 2.
	self deny: documentor modelColors first value equals: documentor modelColors second value.

	documentor model: #model3.
	self assert: documentor modelColors size equals: 3.
	self deny: documentor modelColors first value equals: documentor modelColors third value.
	self deny: documentor modelColors second value equals: documentor modelColors third value.

]
