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

	| entity |
	documentor
		model: FDModel ;
		onlyClasses: { FDTrait3 } ;
		beWithStub ;
		generateClass: (documentor fm3DescriptionOf: FDTrait3).

	self assert: documentor isWithStub.
	self assert: documentor umlEntities size equals: 2.

	entity := documentor umlEntities first.
	self assert: entity class equals: FamixUMLClass.
	self assert: entity name equals: 'Trait3'.
	self deny: entity isStub.

	entity := documentor umlEntities second.
	self assert: entity class equals: FamixUMLClass.
	self assert: entity name equals: 'Trait2'.
	self assert: entity isStub.

	self deny: documentor umlEntities first color equals: documentor umlEntities second color.

]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testBeWithoutStub [

	| umlClass |
	documentor
		model: FDModel ;
		onlyClasses: { FDTrait2 } ;
		beWithoutStub ;
		generateClass: (documentor fm3DescriptionOf: FDTrait2).

	self deny: documentor isWithStub.
	self assert: documentor umlEntities size equals: 1.

	umlClass := documentor umlEntities anyOne.
	self assert: umlClass name equals: 'Trait2'
]

{ #category : #'tests - model' }
FamixUMLDocumentorTest >> testColorForEntity [

	documentor
		model: FDModel ;
		model: FamixStModel ;
		onlyClasses: { FDClass1 . FamixStClass } .

	self
		assert: (documentor colorForEntity: (documentor fm3DescriptionOf: FDClass1))
		equals: (documentor modelColors first value).
	self
		assert: (documentor colorForEntity: (documentor fm3DescriptionOf: FamixStClass))
		equals: (documentor modelColors second value).
]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateClass [

	| fmClass umlClass |
	fmClass := FDModel metamodel fmTypeOf: FDModel.

	documentor
		model: FDModel color: Color red ;
		onlyClasses: { FDClass1 } ;
		generateClass: (documentor fm3DescriptionOf: FDClass1).

	self assert: documentor umlEntities size equals: 1.

	umlClass := documentor umlEntities anyOne.
	self assert: umlClass name equals: 'Class1'.
	self assert: umlClass color equals: Color red.
	self deny: umlClass isTrait
]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateEntireModel [

	documentor
		model: FDModel ;
		generate.

	self assert: (documentor umlEntities count: [:e | e class = FamixUMLClass]) equals: 9

]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGeneratePropertyOf [

	| fmClass umlEntity |

	documentor
		model: FDModel ;
		onlyClasses: { FDTrait4 }.
	fmClass := documentor fm3DescriptionOf: FDTrait4.
	documentor generateClass: fmClass.

	self assert: documentor umlEntities size equals: 1.
	umlEntity := documentor umlEntities anyOne.

	documentor generateProperties: fmClass uml: umlEntity.

	self assert: umlEntity properties size equals: 1.

	umlEntity := umlEntity properties anyOne.
	self assert: umlEntity name equals: 'someProp'.
	self assert: umlEntity type equals: 'String'.

]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateRelationNotWithoutStub [
	"don't generate a relation with a stub if we are WithoutStub"

	documentor
		model: FDModel ;
		onlyClasses: { FDTrait4 } ;
		generateClass: (documentor fm3DescriptionOf: FDTrait4).

	self assert: documentor umlEntities size equals: 1.

	self assert: documentor umlEntities anyOne class equals: FamixUMLClass.
	self assert: documentor umlEntities anyOne name equals: 'Trait4'
]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateRelationOf [

	| rel fmClass1 umlClass1 |

	documentor model: FDModel.
	fmClass1 := documentor fm3DescriptionOf: FDClass1.

	documentor
		onlyClasses: { FDClass1 . FDTrait4 } ;
		generateClass: fmClass1 ;
		generateClass: (documentor fm3DescriptionOf: FDTrait4 ).

	self assert: documentor umlEntities size equals: 2.

	umlClass1 := documentor umlEntities first.
	documentor generateRelations: fmClass1 uml: umlClass1.

	self assert: documentor umlEntities size equals: 3.

	rel := documentor umlEntities detect: [ :e | e class = FamixUMLAssociation ] ifNone: [nil].
	self assert: rel isNotNil.
	self assert: rel aggregation equals: #off.

	self assert: rel source equals: 'Class1'.
	self assert: rel target equals: 'Trait4'.

	self assert: rel sourceRole equals: #myTrait.
	self assert: rel targetRole equals: #class1.

	self assert: rel sourceCardinality equals: #one.
	self assert: rel targetCardinality equals: #multi.

]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateRelationSourceStub [
	"not sure which source/target is stub, but the idea is to test both sides"

	| rel fmClass1 umlClass1 umlClass2 |

	documentor model: FDModel.
	fmClass1 := documentor fm3DescriptionOf: FDClass1.

	documentor
		onlyClasses: { FDClass1 } ;
		beWithStub ;
		generateClass: fmClass1 ;
		generateClass: (documentor fm3DescriptionOf: FDTrait4 ).

	self assert: documentor umlEntities size equals: 4. "Class1 --|> Trait3 ; Class1 --|> FDEntity ; Trait4"

	umlClass1 := documentor umlEntities detect: [:e | e name = 'Class1'].
	self deny: umlClass1 isStub.

	umlClass2 := documentor umlEntities detect: [:e | e name = 'Trait4'].
	self assert: umlClass2 isStub.

	documentor generateRelations: fmClass1 uml: umlClass1.

	self assert: documentor umlEntities size equals: 5.

	rel := documentor umlEntities detect: [ :e | e class = FamixUMLAssociation ] ifNone: [nil].
	self assert: rel isNotNil.
	self assert: rel aggregation equals: #off.

	self assert: rel source equals: 'Class1'.
	self assert: rel target equals: 'Trait4'.

	self assert: rel sourceRole equals: #myTrait.
	self assert: rel targetRole equals: #class1.

	self assert: rel sourceCardinality equals: #one.
	self assert: rel targetCardinality equals: #multi.

]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateRelationSourceTargetStubs [

	| rel fmClass1 umlClass1 umlClass2 |

	documentor model: FDModel.
	fmClass1 := documentor fm3DescriptionOf: FDClass1.

	documentor
		onlyClasses: { FDClass2 } ;
		beWithStub ;
		generateClass: (documentor fm3DescriptionOf: FDClass2 ) ;
		generateClass: (documentor fm3DescriptionOf: FDTrait4 ).

	self assert: documentor umlEntities size equals: 3. "Class2 --|> Class1 ; Trait4"

	umlClass1 := documentor umlEntities detect: [:e | e name = 'Class1'].
	self assert: umlClass1 isStub.

	umlClass2 := documentor umlEntities detect: [:e | e name = 'Trait4'].
	self assert: umlClass2 isStub.

	documentor generateRelations: fmClass1 uml: umlClass1.

	self assert: documentor umlEntities size equals: 4.

	rel := documentor umlEntities detect: [ :e | e class = FamixUMLAssociation ] ifNone: [nil].
	self assert: rel isNotNil.
	self assert: rel aggregation equals: #off.

	self assert: rel source equals: 'Class1'.
	self assert: rel target equals: 'Trait4'.

	self assert: rel sourceRole equals: #myTrait.
	self assert: rel targetRole equals: #class1.

	self assert: rel sourceCardinality equals: #one.
	self assert: rel targetCardinality equals: #multi.

]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateRelationTargetStub [
	"not sure which source/target is stub, but the idea is to test both sides"

	| rel fmClass1 umlClass1 umlClass2 |

	documentor model: FDModel.
	fmClass1 := documentor fm3DescriptionOf: FDClass1.

	documentor
		onlyClasses: { FDTrait4 } ;
		beWithStub ;
		generateClass: fmClass1 ;
		generateClass: (documentor fm3DescriptionOf: FDTrait4 ).

	self assert: documentor umlEntities size equals: 3. "Trait4 --|> Trait2 ; Class1"

	umlClass1 := documentor umlEntities detect: [:e | e name = 'Class1'].
	self assert: umlClass1 isStub.

	umlClass2 := documentor umlEntities detect: [:e | e name = 'Trait4'].
	self deny: umlClass2 isStub.

	documentor generateRelations: fmClass1 uml: umlClass1.

	self assert: documentor umlEntities size equals: 4.

	rel := documentor umlEntities detect: [ :e | e class = FamixUMLAssociation ] ifNone: [nil].
	self assert: rel isNotNil.
	self assert: rel aggregation equals: #off.

	self assert: rel source equals: 'Class1'.
	self assert: rel target equals: 'Trait4'.

	self assert: rel sourceRole equals: #myTrait.
	self assert: rel targetRole equals: #class1.

	self assert: rel sourceCardinality equals: #one.
	self assert: rel targetCardinality equals: #multi.

]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateTrait [

	| umlClass |

	documentor
		model: FDModel color: Color red ;
		onlyClasses: { FDTrait1 } ;
		generateClass: (documentor fm3DescriptionOf: FDTrait1).

	self assert: documentor umlEntities size equals: 1.

	umlClass := documentor umlEntities anyOne.
	self assert: umlClass name equals: 'Trait1'.
	self assert: umlClass color equals: Color red.
	self assert: umlClass isTrait
]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateUMLInheritance [

	| fmClass2 umlClass2 inh |

	documentor model: FDModel.
	fmClass2 := documentor fm3DescriptionOf: FDClass2.

	documentor
		onlyClasses: { FDClass1 . FDClass2 } ;
		generateClass: (documentor fm3DescriptionOf: FDClass1) ;
		generateClass: fmClass2.

	self assert: documentor umlEntities size equals: 2.

	umlClass2 := documentor umlEntities second.
	documentor generateInheritance: fmClass2 uml: umlClass2.

	self assert: documentor umlEntities size equals: 3.
	
	inh := documentor umlEntities detect: [ :e | e class = FamixUMLInheritance] ifNone: [nil].
	self assert: inh isNotNil.
	self assert: inh source equals: 'Class2'.
	self assert: inh target equals: 'Class1'.
]

{ #category : #'tests - generation' }
FamixUMLDocumentorTest >> testGenerateUMLUse [

	| fmClass1 umlClass1 use |

	documentor model: FDModel.
	fmClass1 := documentor fm3DescriptionOf: FDClass1.

	documentor
		onlyClasses: { FDClass1 . FDTrait3 } ;
		generateClass: fmClass1 ;
		generateClass: (documentor fm3DescriptionOf: FDTrait3).

	self assert: documentor umlEntities size equals: 2.

	umlClass1 := documentor umlEntities first.
	documentor generateInheritance: fmClass1 uml: umlClass1.

	self assert: documentor umlEntities size equals: 3.
	
	use := documentor umlEntities detect: [ :e | e class = FamixUMLUse] ifNone: [nil].
	self assert: use isNotNil.
	self assert: use source equals: 'Class1'.
	self assert: use target equals: 'Trait3'.
]

{ #category : #'tests - model' }
FamixUMLDocumentorTest >> testIsStubClass [

	documentor
		model: FDModel ;
		onlyClasses: { FDClass1 . FDTrait1 . FDTrait3 }.

	self assert: (documentor userRequestedClass: (documentor fm3DescriptionOf: FDClass1)).
	self assert: (documentor userRequestedClass: (documentor fm3DescriptionOf: FDTrait1)).
	self deny: (documentor userRequestedClass: (documentor fm3DescriptionOf: FDClass2)).
	self deny: (documentor userRequestedClass: (documentor fm3DescriptionOf: FDTrait2)).
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
