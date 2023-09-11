Class {
	#name : #MooseSampleData,
	#superclass : #TestResource,
	#instVars : [
		'moosemodel1',
		'moosemodel2',
		'moosemodel3',
		'moosemodel4',
		'moosemodel5'
	],
	#category : #'Moose-Core-Tests'
}

{ #category : #initialization }
MooseSampleData >> initialize [
	super initialize.
	moosemodel1 := (self readMSEString: self modelVersion1) name: #'Simple model 1'.
	moosemodel2 := (self readMSEString: self modelVersion2) name: #'Simple model 2'.
	moosemodel3 := (self readMSEString: self modelVersion3) name: #'Simple model 3'.
	moosemodel4 := (self readMSEString: self modelVersion4) name: #'Simple model 4'.
	moosemodel5 := (self readMSEString: self modelVersion5) name: #'Simple model 5'
]

{ #category : #data }
MooseSampleData >> modelVersion1 [

	^ '(
	(Moose-Core-Tests-Entities.Namespace (id: 1) (name ''aNamespace''))

	(Moose-Core-Tests-Entities.Class (id: 2) (name ''ClassA'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))
	(Moose-Core-Tests-Entities.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 2))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 3) (name ''ClassB'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(Moose-Core-Tests-Entities.Package (id: 201) (name ''aPackage''))
	(Moose-Core-Tests-Entities.Package (id: 202) (name ''aPackage'') (parentPackage (ref: 201)))
)'
]

{ #category : #data }
MooseSampleData >> modelVersion2 [

	^ '(
	(Moose-Core-Tests-Entities.Namespace (id: 1) (name ''aNamespace''))

	(Moose-Core-Tests-Entities.Class (id: 2) (name ''ClassA'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))
	(Moose-Core-Tests-Entities.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(Moose-Core-Tests-Entities.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 3) (name ''ClassB'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 4) (name ''ClassC'') (typeContainer (ref: 1)) (parentPackage (ref: 202)))
	(Moose-Core-Tests-Entities.Method (name ''methodC1'') (signature ''methodC1()'') (parentType (ref: 4)) (numberOfLinesOfCode 4))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 4)) (superclass (ref: 2)))

	(Moose-Core-Tests-Entities.Package (id: 201) (name ''aPackage''))
	(Moose-Core-Tests-Entities.Package (id: 202) (name ''anotherPackage''))
	(Moose-Core-Tests-Entities.Package (id: 203) (name ''aPackage'') (parentPackage (ref: 201)))


	(Moose-Core-Tests-Entities.Package (id: 201) (name ''aPackage''))
	(Moose-Core-Tests-Entities.Package (id: 202) (name ''aPackage'') (parentPackage (ref: 201)))
)'
]

{ #category : #data }
MooseSampleData >> modelVersion3 [

	^ '(
	(Moose-Core-Tests-Entities.Namespace (id: 1) (name ''aNamespace''))

	(Moose-Core-Tests-Entities.Class (id: 2) (name ''ClassA'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))
	(Moose-Core-Tests-Entities.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(Moose-Core-Tests-Entities.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 3) (name ''ClassB'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 4) (name ''ClassC'') (typeContainer (ref: 1)) (parentPackage (ref: 202)))
	(Moose-Core-Tests-Entities.Method (name ''methodC1'') (signature ''methodC1()'') (parentType (ref: 4)) (numberOfLinesOfCode 4))
	(Moose-Core-Tests-Entities.Method (name ''methodC2'') (signature ''methodC2()'') (parentType (ref: 4)) (numberOfLinesOfCode 10))
	(Moose-Core-Tests-Entities.Method (name ''methodC3'') (signature ''methodC3()'') (parentType (ref: 4)) (numberOfLinesOfCode 7))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeC1'') (parentType (ref: 4)))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeC2'') (parentType (ref: 4)))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 4)) (superclass (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 5) (name ''ClassD'') (typeContainer (ref: 1)) (parentPackage (ref: 202)))
	(Moose-Core-Tests-Entities.Method (name ''methodD1'') (signature ''methodD1()'') (parentType (ref: 5)) (numberOfLinesOfCode 3))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 5)) (superclass (ref: 4)))

	(Moose-Core-Tests-Entities.Package (id: 201) (name ''aPackage''))
	(Moose-Core-Tests-Entities.Package (id: 202) (name ''anotherPackage'')))'
]

{ #category : #data }
MooseSampleData >> modelVersion4 [

	^ '(
	(Moose-Core-Tests-Entities.Namespace (id: 1) (name ''aNamespace''))

	(Moose-Core-Tests-Entities.Class (id: 2) (name ''ClassA'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))
	(Moose-Core-Tests-Entities.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(Moose-Core-Tests-Entities.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 3) (name ''ClassB'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 4) (name ''ClassC'') (typeContainer (ref: 1)) (parentPackage (ref: 203)))
	(Moose-Core-Tests-Entities.Method (name ''methodC1'') (signature ''methodC1()'') (parentType (ref: 4)) (numberOfLinesOfCode 4))
	(Moose-Core-Tests-Entities.Method (name ''methodC2'') (signature ''methodC2()'') (parentType (ref: 4)) (numberOfLinesOfCode 10))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeC1'') (parentType (ref: 4)))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 4)) (superclass (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 5) (name ''ClassD'') (typeContainer (ref: 1)) (parentPackage (ref: 203)))
	(Moose-Core-Tests-Entities.Method (name ''methodD1'') (signature ''methodD1()'') (parentType (ref: 5)) (numberOfLinesOfCode 15))
	(Moose-Core-Tests-Entities.Method (name ''methodD2'') (signature ''methodD2()'') (parentType (ref: 5)) (numberOfLinesOfCode 7))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeD1'') (parentType (ref: 4)))
	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 5)) (superclass (ref: 4)))


	(Moose-Core-Tests-Entities.Namespace (id: 101) (name ''anotherNamespace'') (parentScope (ref: 1)))
	(Moose-Core-Tests-Entities.Class (id: 102) (name ''ClassA'') (typeContainer (ref: 101)) (parentPackage (ref: 203)))

	(Moose-Core-Tests-Entities.Package (id: 201) (name ''aPackage''))
	(Moose-Core-Tests-Entities.Package (id: 203) (name ''yetAnotherPackage'') (parentPackage (ref: 201)))

)'
]

{ #category : #data }
MooseSampleData >> modelVersion5 [

	^ '(
	(Moose-Core-Tests-Entities.Namespace (id: 1) (name ''aNamespace''))

	(Moose-Core-Tests-Entities.Class (id: 2) (name ''ClassA'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))
	(Moose-Core-Tests-Entities.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(Moose-Core-Tests-Entities.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 3) (name ''ClassB'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 5) (name ''ClassD'') (typeContainer (ref: 1)) (parentPackage (ref: 203)))
	(Moose-Core-Tests-Entities.Method (name ''methodD1'') (signature ''methodD1()'') (parentType (ref: 5)) (numberOfLinesOfCode 15))
	(Moose-Core-Tests-Entities.Method (name ''methodD2'') (signature ''methodD2()'') (parentType (ref: 5)) (numberOfLinesOfCode 7))
	(Moose-Core-Tests-Entities.Method (name ''methodD3'') (signature ''methodC1()'') (parentType (ref: 5)) (numberOfLinesOfCode 4))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeD1'') (parentType (ref: 5)))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeD2'') (parentType (ref: 5)))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 5)) (superclass (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 6) (name ''ClassE'') (typeContainer (ref: 1)) (parentPackage (ref: 203)))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeE1'') (parentType (ref: 6)))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 6)) (superclass (ref: 3)))

	(Moose-Core-Tests-Entities.Package (id: 201) (name ''aPackage''))
	(Moose-Core-Tests-Entities.Package (id: 203) (name ''yetAnotherPackage'') (parentPackage (ref: 201)))
)'
]

{ #category : #util }
MooseSampleData >> readMSEString: aString [

	^ MooseMSEImporterTestModel new importFromMSEStream:
		  aString readStream
]

{ #category : #running }
MooseSampleData >> setUp [
	self initialize
]

{ #category : #accessing }
MooseSampleData >> simpleModel1 [
	^moosemodel1
]

{ #category : #accessing }
MooseSampleData >> simpleModel2 [
	^moosemodel2
]

{ #category : #accessing }
MooseSampleData >> simpleModel3 [
	^moosemodel3
]

{ #category : #accessing }
MooseSampleData >> simpleModel4 [
	^moosemodel4
]

{ #category : #accessing }
MooseSampleData >> simpleModel5 [
	^moosemodel5
]
