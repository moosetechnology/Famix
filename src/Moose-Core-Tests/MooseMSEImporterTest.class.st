Class {
	#name : #MooseMSEImporterTest,
	#superclass : #TestCase,
	#category : #'Moose-Core-Tests'
}

{ #category : #util }
MooseMSEImporterTest >> readMSEStream: aStream [

	^ MooseMSEImporterTestModel new importFromMSEStream: aStream
]

{ #category : #tests }
MooseMSEImporterTest >> testComplex [

	| mooseModel |
	mooseModel := self readMSEStream: '(
	(Moose-Core-Tests-Entities.Namespace (id: 1) (name ''aNamespace''))

	(Moose-Core-Tests-Entities.Class (id: 2) (name ''ClassA'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))
	(Moose-Core-Tests-Entities.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 2))
	(Moose-Core-Tests-Entities.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(Moose-Core-Tests-Entities.Class (id: 3) (name ''ClassB'') (typeContainer (ref: 1)) (parentPackage (ref: 201)))

	(Moose-Core-Tests-Entities.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(Moose-Core-Tests-Entities.Package (id: 201) (name ''aPackage''))
	(Moose-Core-Tests-Entities.Package (id: 202) (name ''aPackage'') (parentPackage (ref: 201)))
)' readStream.

	self denyEmpty: mooseModel entities.
	self assert:
		((mooseModel allPackages collect: #name) includes: 'aPackage').
	self assert:
		((mooseModel allClasses collect: #name) includes: 'ClassA')
]

{ #category : #tests }
MooseMSEImporterTest >> testOneClass [

	| mooseModel |
	mooseModel := self readMSEStream:
		              '((Moose-Core-Tests-Entities.Class (name ''ClassA'')))'
			              readStream.
	self denyEmpty: mooseModel entities.
	self
		assert: (mooseModel allClasses collect: #name) first
		equals: 'ClassA'
]

{ #category : #tests }
MooseMSEImporterTest >> testOneClassAndOnePackage [

	| mooseModel |
	mooseModel := self readMSEStream: '(
	(Moose-Core-Tests-Entities.Class (id: 2) (name ''ClassA'') (parentPackage (ref: 201)))
	(Moose-Core-Tests-Entities.Package (id: 201) (name ''aPackage''))	
)' readStream.
	self denyEmpty: mooseModel entities.
	self
		assert: (mooseModel allPackages collect: #name) first
		equals: 'aPackage'.
	self
		assert: (mooseModel allClasses collect: #name) first
		equals: 'ClassA'
]

{ #category : #tests }
MooseMSEImporterTest >> testOnePackage [

	| mooseModel |
	mooseModel := self readMSEStream:
		              '((Moose-Core-Tests-Entities.Package (name ''PackageA'')))'
			              readStream.

	self denyEmpty: mooseModel entities.
	self assert:
		((mooseModel allPackages collect: #name) includes: 'PackageA')
]

{ #category : #tests }
MooseMSEImporterTest >> testOnePrimitiveType [

	| mooseModel |
	mooseModel := self readMSEStream:
		              '((Moose-Core-Tests-Entities.PrimitiveType (name ''int'')))'
			              readStream.
	self denyEmpty: mooseModel entities.
	self
		assert: (mooseModel allPrimitiveTypes collect: #name) first
		equals: 'int'
]

{ #category : #tests }
MooseMSEImporterTest >> testOnePrimitiveTypeAndMethod [

	| mooseModel |
	mooseModel := self readMSEStream: '(
(Moose-Core-Tests-Entities.PrimitiveType (id: 1) (name ''int''))
(Moose-Core-Tests-Entities.Class (id: 2) (name ''ClassA''))
(Moose-Core-Tests-Entities.Method (id: 3) (name ''methodA'') (declaredType (ref: 1)) (parentType (ref: 2)))
)' readStream.
	self
		assert: (mooseModel allPrimitiveTypes collect: #name) first
		equals: 'int'.
	self
		assert: mooseModel allMethods first declaredType
		equals: mooseModel allPrimitiveTypes first
]

{ #category : #tests }
MooseMSEImporterTest >> testPropertyWithNoSetter [

	| mooseModel |
	mooseModel := self readMSEStream:
		              '((Moose-Core-Tests-Entities.Class (name ''ClassA'') (numberOfLinesOfCode 42)))'
			              readStream.
	self assert: mooseModel allClasses first name equals: 'ClassA'.
	self
		assert: mooseModel allClasses first numberOfLinesOfCode
		equals: 42
]

{ #category : #tests }
MooseMSEImporterTest >> testSimple [

	| mooseSample mooseModel classA |
	mooseSample := MooseSampleData new.
	mooseModel := self readMSEStream:
		              mooseSample modelVersion1 readStream.
	self denyEmpty: mooseModel entities.
	self
		assert:
		(mooseModel allClasses collect: #name) asSortedCollection asArray
		equals: { 'ClassA'. 'ClassB' }.
	self
		assert: (mooseModel allPackages collect: #name) asArray
		equals: { 'aPackage'. 'aPackage' }.
	classA := mooseModel entityNamed: #'aNamespace::ClassA'.
	self assert: classA isNotNil.
	self
		assert: classA typeContainer
		identicalTo: (mooseModel entityNamed: #aNamespace).
	self assert: classA methods size equals: 1. "====="
	self
		shouldnt: [ 
		self readMSEStream: mooseSample modelVersion2 readStream ]
		raise: Error.
	self
		shouldnt: [ 
		self readMSEStream: mooseSample modelVersion3 readStream ]
		raise: Error.
	self
		shouldnt: [ 
		self readMSEStream: mooseSample modelVersion4 readStream ]
		raise: Error.
	self
		shouldnt: [ 
		self readMSEStream: mooseSample modelVersion5 readStream ]
		raise: Error
]

{ #category : #tests }
MooseMSEImporterTest >> testUndeclaredProperty [

	| mooseModel |
	"The importer writes a trace when a property is undeclared.
	This line will appear in CI traces, hence the following:"
	self trace: '[Testing: This line is expected] '.
	mooseModel := self readMSEStream:
		              '((Moose-Core-Tests-Entities.Class (name ''ClassA'') (Undeclared 42) ))'
			              readStream.

	self assert: mooseModel allClasses first name equals: 'ClassA'.
	self assert:
		(mooseModel allClasses first propertyNamed: #Undeclared) isNotNil.
	self
		assert: (mooseModel allClasses first propertyNamed: #Undeclared)
		equals: 42
]
