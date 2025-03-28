"
A special ctest class for importing stub methods, because by defualt they are not imported and therefore, we need to have a special setup here
"
Class {
	#name : #ImportStubMethodSpecialTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Moose-SmalltalkImporter-LAN-Tests'
}

{ #category : #running }
ImportStubMethodSpecialTest >> setUp [

	| importingTask |
	super setUp.
	importingTask := FamixStPharoImporterTask new
		                 model: FamixStModel new;
		                 addFromPackageNamed: #'Moose-TestResources-LAN';
		                 yourself.
	importingTask importingContext importStubMethod.
	importingTask run.
	model := importingTask model
]

{ #category : #tests }
ImportStubMethodSpecialTest >> testStubMethodCreation [
	self denyEmpty: (model allMethods select: #isStub).
	self denyEmpty: model allModelMethods
]

{ #category : #tests }
ImportStubMethodSpecialTest >> testStubParentsAreInMooseModel [

	| method class |
	method := model entityNamed: #'Smalltalk.False.ifTrue:(Object)'.
	self assert: method mooseModel isNotNil.
	self assert: method isStub.

	class := method parentType.
	self assert: class name equals: 'False'.
	self assert: class mooseModel isNotNil.
	self assert: class isStub
]
