Class {
	#name : #FamixMMUMLDocumentorVisitorTest,
	#superclass : #FamixMMUMLDocumentorAbstractTest,
	#category : #'Famix-MetamodelDocumentor-tests'
}

{ #category : #'tests-generating' }
FamixMMUMLDocumentorVisitorTest >> testTypeOfExternal [
	| contents |
	contents := FamixMMUMLDocumentor new
		beWithStub;
 		model: FDModel ;
 		generate.

	self assert: documentor umlModel size equals: 1.

	self assert: [ contents includesSubstring: 'class Model <<(C,LightYellow)External>>' ].
]

{ #category : #'tests-visiting' }
FamixMMUMLDocumentorVisitorTest >> testVisitClassNoAttributes [
	| entity |

	documentor visitClass: (self famixClassFor: FamixTest4Book).
	
	self assert: documentor umlModel size equals: 1.

	entity := documentor umlModel anyOne.
	self assert: entity class equals: FamixMMUMLClass.
	self assert: entity name equals: 'Book'.
	self assert: entity marker equals: $C.
	self assert: entity color equals: 'white'.

	"class Book << (C,white) >> #FFFFFF"
]

{ #category : #'tests-visiting' }
FamixMMUMLDocumentorVisitorTest >> testVisitClassWithAttributes [

	| entity |
	documentor visitClass: (self famixClassFor: FamixTest4Entity).
	
	self assert: documentor umlModel size equals: 1.

	entity := documentor umlModel anyOne.
	self assert: entity class equals: FamixMMUMLClass.
	self assert: entity name equals: 'Entity'.
	self assert: entity properties size equals: 1.

	entity := entity properties anyOne.
	self assert: entity name equals: 'name'.
	self assert: entity type equals: 'String'
]

{ #category : #'tests-visiting' }
FamixMMUMLDocumentorVisitorTest >> testVisitInheritance [
	| person student entity |
	person := self famixClassFor: FamixTest4Person.
	student := self famixClassFor: FamixTest4Student. 
	documentor
		classesOfInterest: { person . student } ;
		visitInheritance: person sub: student.
		
	self assert: documentor externalClasses isEmpty.

	self assert: documentor umlModel size equals: 1.

	entity := documentor umlModel anyOne.
	self assert: entity class equals: FamixMMUMLInheritance.
	self assert: entity source equals: 'Student'.
	self assert: entity target equals: 'Person'.

]

{ #category : #'tests-visiting' }
FamixMMUMLDocumentorVisitorTest >> testVisitInheritanceFromExternal [
	| person student entity |
	person := self famixClassFor: FamixTest4Person.
	student := self famixClassFor: FamixTest4Student. 
	documentor
		beWithStub ;
		classesOfInterest: {  person } ;
		visitInheritance: person sub: student.
		
	"self assert: documentor externalClasses notEmpty."

	self assert: documentor umlModel size equals: 1.

	entity := documentor umlModel anyOne.
	self assert: entity class equals: FamixMMUMLInheritance.
	self assert: entity source equals: 'Student'.
	self assert: entity target equals: 'Person'.

]

{ #category : #'tests-visiting' }
FamixMMUMLDocumentorVisitorTest >> testVisitInheritanceToExternal [
	| person student entity |
	person := self famixClassFor: FamixTest4Person.
	student := self famixClassFor: FamixTest4Student. 
	documentor
		beWithStub ;
		classesOfInterest: {  student } ;
		visitInheritance: person sub: student.
		
	"self assert: documentor externalClasses notEmpty."

	self assert: documentor umlModel size equals: 1.

	entity := documentor umlModel anyOne.
	self assert: entity class equals: FamixMMUMLInheritance.
	self assert: entity source equals: 'Student'.
	self assert: entity target equals: 'Person'.

]

{ #category : #'tests-visiting' }
FamixMMUMLDocumentorVisitorTest >> testVisitRelationContainer [
	| principal school entity | 
	principal := self famixClassFor: FamixTest4Principal.
	school := self famixClassFor: FamixTest4School.
	documentor
		classesOfInterest: { principal . school } ;
		visitRelation: (self famixProperty: 'school' in: FamixTest4Principal).

	self assert: documentor externalClasses isEmpty.

	"stream contents equals: 'Principal ""principal"" --o ""school"" School' ".

	self assert: documentor umlModel size equals: 3.

	entity := documentor umlModel detect: [:each | each class = FamixMMUMLAssociation ].
	self assert: entity source equals: 'Principal'.
	self assert: entity target equals: 'School'.
	self assert: entity sourceRole equals: 'school'.
	self assert: entity targetRole equals: 'principal'.
	self assert: entity sourceCardinality equals: ''.
	self assert: entity targetCardinality equals: ''.
	self assert: entity aggregation equals: #source.
]

{ #category : #'tests-visiting' }
FamixMMUMLDocumentorVisitorTest >> testVisitRelationContainerSourceMany [
	| book person entity | 
	book := self famixClassFor: FamixTest4Book.
	person := self famixClassFor: FamixTest4Person.
	documentor
		classesOfInterest: { person . book } ;
		visitRelation: (self famixProperty: 'person' in: FamixTest4Book).
		
	self assert: documentor externalClasses isEmpty.

	"stream contents equals: 'Book "" *books"" --o ""person"" Person'."

	self assert: documentor umlModel size equals: 3.

	entity := documentor umlModel detect: [:each | each class = FamixMMUMLAssociation ].
	self assert: entity source equals: 'Book'.
	self assert: entity target equals: 'Person'.
	self assert: entity sourceRole equals: 'person'.
	self assert: entity targetRole equals: 'books'.
	self assert: entity sourceCardinality equals: ''.
	self assert: entity targetCardinality equals: '*'.
	self assert: entity aggregation equals: #source.
]

{ #category : #'tests-visiting' }
FamixMMUMLDocumentorVisitorTest >> testVisitRelationNoContainer [
	| student teacher entity | 
	student := self famixClassFor: FamixTest4Student.
	teacher := self famixClassFor: FamixTest4Teacher.
	documentor
		classesOfInterest: { teacher . student } ;
		visitRelation: (self famixProperty: 'students' in: FamixTest4Teacher).
		
	self assert: documentor externalClasses isEmpty.
	
	"stream contents equals: 'Teacher "" *teachers"" -- "" *students"" Student'."

	self assert: documentor umlModel size equals: 3.

	entity := documentor umlModel detect: [:each | each class = FamixMMUMLAssociation ].
	self assert: entity source equals: 'Teacher'.
	self assert: entity target equals: 'Student'.
	self assert: entity sourceRole equals: 'students'.
	self assert: entity targetRole equals: 'teachers'.
	self assert: entity sourceCardinality equals: '*'.
	self assert: entity targetCardinality equals: '*'.
	self assert: entity aggregation isNil.
]

{ #category : #'tests-visiting' }
FamixMMUMLDocumentorVisitorTest >> testVisitRelationToExternalClass [
	| student teacher entity | 
	student := self famixClassFor: FamixTest4Student.
	teacher := self famixClassFor: FamixTest4Teacher.
	documentor
		classesOfInterest: { teacher } ;
		beWithStub ;
		visitRelation: (self famixProperty: 'students' in: FamixTest4Teacher).
		
	self assert: documentor externalClasses notEmpty.
	
	"stream contents equals: 'Teacher "" *teachers"" -- "" *students"" Student'."

	self assert: documentor umlModel size equals: 3.

	entity := documentor umlModel detect: [:each | each class = FamixMMUMLAssociation ].
	self assert: entity source equals: 'Teacher'.
	self assert: entity target equals: 'Student'.
	self assert: entity sourceRole equals: 'students'.
	self assert: entity targetRole equals: 'teachers'.
	self assert: entity sourceCardinality equals: '*'.
	self assert: entity targetCardinality equals: '*'.
	self assert: entity aggregation isNil.
]

{ #category : #'tests-generating' }
FamixMMUMLDocumentorVisitorTest >> testVisitTraitUsed [
	| contents |
	contents := FamixMMUMLDocumentor new
 		model: FDModel ;
 		generatePlantUMLModel. 
		
	self assert: [ contents includesSubstring: 'Trait1 <|.. Trait2' ].
	self assert: [ contents includesSubstring: 'Trait2 <|.. Trait3' ].
	self assert: [ contents includesSubstring: 'Trait2 <|.. Trait4' ].
	self assert: [ (contents includesSubstring: 'Trait1 <|.. Trait4')not ].
	self assert: [ (contents includesSubstring: 'Trait1 <|.. Trait3')not ].
]

{ #category : #'tests-generating' }
FamixMMUMLDocumentorVisitorTest >> testVisitWithoutClasses [
	| contents |
	contents := FamixMMUMLDocumentor new
 		model: FDModel ;
 		generatePlantUMLModelWithout: { }. 
	
	contents := FamixMMUMLDocumentor new
 		model: FDModel ;
 		generatePlantUMLModelWithout: { FDTrait1 . FDTrait2 }.
		
	self assert: [ contents includesSubstring: 'hide Trait1' ].
	self assert: [ (contents allButFirst: 450) includesSubstring: 'hide Trait2' ].
]

{ #category : #'tests-generating' }
FamixMMUMLDocumentorVisitorTest >> testVisitWithoutClassesWithEmptyCollection [
	| contents |
	contents := FamixMMUMLDocumentor new
 		model: FDModel ;
 		generatePlantUMLModelWithout: { }. 
	
	self assert: [ ((contents allButFirst: 30) includesSubstring: 'hide')not ].
]
