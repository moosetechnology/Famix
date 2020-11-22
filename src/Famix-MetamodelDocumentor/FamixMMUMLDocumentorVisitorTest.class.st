Class {
	#name : #FamixMMUMLDocumentorVisitorTest,
	#superclass : #FamixMMUMLDocumentorAbstractTest,
	#category : #'Famix-MetamodelDocumentor-tests'
}

{ #category : #tests }
FamixMMUMLDocumentorVisitorTest >> testVisitClassNoAttributes [

	documentor visitClass: (self famixClassFor: FamixTest4Book).
	
	self
		assert: stream contents
		equals:
'class Book << (C,white) >> {
}
'
]

{ #category : #tests }
FamixMMUMLDocumentorVisitorTest >> testVisitClassWithAttributes [

	documentor visitClass: (self famixClassFor: FamixTest4Entity).
	
	self
		assert: stream contents
		equals:
'class Entity << (C,white) >> {
  String name
}
'
]

{ #category : #tests }
FamixMMUMLDocumentorVisitorTest >> testVisitInheritance [
	| person student |
	person := self famixClassFor: FamixTest4Person.
	student := self famixClassFor: FamixTest4Student. 
	documentor
		classesOfInterest: { person . student } ;
		visitInheritance: person sub: student.

	self
		assert: stream contents
		equals:
'Person <|-- Student
'
]

{ #category : #tests }
FamixMMUMLDocumentorVisitorTest >> testVisitRelation [
	| book person | 
	book := self famixClassFor: FamixTest4Book.
	person := self famixClassFor: FamixTest4Person.
	documentor
		classesOfInterest: { person . book } ;
		visitRelation: (self famixProperty: 'person' in: FamixTest4Book).

	self
		assert: stream contents
		equals:
'Book "books" -- "person" Person
'
]
