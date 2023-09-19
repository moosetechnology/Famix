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
FamixUMLDocumentorTest >> setUp [
	super setUp.

	documentor := FamixUMLDocumentor new
]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testBeWithStub [

	| entities |
	documentor
		model: FDModel ;
		onlyClasses: { FDTrait3 } ;
		beWithStub ;
		generate.

	self assert: documentor isWithStub.
	self assert: documentor umlEntities size equals: 3.

	self assert: (documentor umlEntities count: [ :e | e class = FamixUMLUse]) equals: 1.

	entities := documentor umlEntities select: [ :e | e class = FamixUMLClass].
	self assert: entities size equals: 2.

	self assert: (entities count: #isStub) equals: 1.
	self deny: entities first color equals: entities second color.

]

{ #category : #'tests - generation' }
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

{ #category : #'tests - model' }
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

{ #category : #'tests - generation' }
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

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGeneratePropertyOf [

	| fmClass umlEntity |
	fmClass := FDModel metamodel fmTypeOf: FDTrait4.

	documentor model: FDModel.
	documentor fmClasses: { fmClass }.
	documentor generateClass: fmClass.

	self assert: documentor umlEntities size equals: 1.

	umlEntity := documentor umlEntities anyOne.
	self assert: umlEntity name equals: 'Trait4'.
	self assert: umlEntity properties size equals: 1.

	umlEntity := umlEntity properties anyOne.
	self assert: umlEntity name equals: 'someProp'.
	self assert: umlEntity type equals: 'String'.

]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateRelationBetweenStub [

	documentor
		model: FDModel ;
		onlyClasses: { FDClass1 . FDTrait4 } ;
		beWithStub ;
		generate.

	self assert: documentor umlEntities size equals: 10.

	self assert: (documentor umlEntities count: [ :e | e class = FamixUMLClass ]) equals: 5.
	self assert: (documentor umlEntities count: [ :e | e class = FamixUMLAssociation ]) equals: 1.
	self assert: (documentor umlEntities count: [ :e | e class = FamixUMLInheritance ]) equals: 1.
	self assert: (documentor umlEntities count: [ :e | e class = FamixUMLUse ]) equals: 3.
]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateRelationOf [

	| umlEntity |
	documentor
		model: FDModel ;
		onlyClasses: { FDClass1 . FDTrait4 } ;
		generate.

	self assert: documentor umlEntities size equals: 3.

	umlEntity := documentor umlEntities detect: [ :e | e class = FamixUMLAssociation ] ifNone: [nil].
	self assert: umlEntity isNotNil.
	self assert: umlEntity aggregation equals: #off.

	self assert: umlEntity source equals: 'Class1'.
	self assert: umlEntity target equals: 'Trait4'.

	self assert: umlEntity sourceRole equals: #class1.
	self assert: umlEntity targetRole equals: #myTrait.

	self assert: umlEntity sourceCardinality equals: #one.
	self assert: umlEntity targetCardinality equals: #multi.

]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateRelationOfWithStub [

	| umlEntity |

	documentor
		model: FDModel ;
		onlyClasses: { FDTrait4 } ;
		beWithStub ;
		generate.

	self assert: documentor umlEntities size equals: 5. "Class1, Trait4, Trait2, FamixUMLAssociation, FamixUMLUse"

	umlEntity := documentor umlEntities detect: [ :e | e class = FamixUMLAssociation ] ifNone: [nil].
	self assert: umlEntity isNotNil.
	self assert: umlEntity aggregation equals: #off.

	self assert: umlEntity source equals: 'Trait4'. "because it comes from generating class 'Trait4'"
	self assert: umlEntity target equals: 'Class1'.

	self assert: umlEntity sourceCardinality equals: #multi.
	self assert: umlEntity targetCardinality equals: #one.

]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateRelationOfWithoutStub [

	| fmTrait4 |
	fmTrait4 := FDModel metamodel fmTypeOf: FDTrait4.

	documentor model: FDModel.
	documentor fmClasses: { fmTrait4 }.
	documentor generateClass: fmTrait4.

	self assert: documentor umlEntities size equals: 1.

	self assert: documentor umlEntities anyOne class equals: FamixUMLClass.
	self assert: documentor umlEntities anyOne name equals: 'Trait4'
]

{ #category : #'tests - generation' }
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

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateUMLInheritance [

	| inh |
	documentor model: FDModel.
	documentor onlyClasses: { FDClass1 . FDClass2 }.

	documentor generate.

	self assert: documentor umlEntities size equals: 3.

	self assert: (documentor umlEntities count: [ :e | e class = FamixUMLClass]) equals: 2.
	
	self assert: (documentor umlEntities count: [ :e | e class = FamixUMLInheritance]) equals: 1.
	
	inh := documentor umlEntities detect: [ :e | e class = FamixUMLInheritance].
	self assert: inh source equals: 'Class2'.
	self assert: inh target equals: 'Class1'.
]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateUMLUse [

	documentor model: FDModel.
	documentor onlyClasses: { FDClass1 . FDTrait3 }.

	documentor generate.

	self assert: documentor umlEntities size equals: 3.

	self assert: (documentor umlEntities count: [ :e | e class = FamixUMLClass]) equals: 2.
	self assert: (documentor umlEntities count: [ :e | e class = FamixUMLUse]) equals: 1.
]

{ #category : #'tests - model' }
FamixUMLDocumentorTest >> testModel [

	self assert: documentor modelColors size equals: 0.

	documentor model: #aModel.

	self assert: documentor modelColors size equals: 1.
	self assert: documentor modelColors anyOne key equals: #aModel.
	self assert: documentor modelColors anyOne value equals: Color white.
]

{ #category : #'tests - model' }
FamixUMLDocumentorTest >> testModelColor [

	documentor model: #aModel color: Color red.

	self assert: documentor modelColors anyOne value equals: Color red.
]

{ #category : #'tests - model' }
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
