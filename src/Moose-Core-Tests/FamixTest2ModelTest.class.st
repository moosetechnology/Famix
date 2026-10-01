"
I am test runed on FamixTest2 model to be able to tests features were you need a real model.
"
Class {
	#name : #FamixTest2ModelTest,
	#superclass : #MooseModelTest,
	#category : #'Moose-Core-Tests'
}

{ #category : #helpers }
FamixTest2ModelTest >> actualClass [
	^ FamixTest2Model
]

{ #category : #tests }
FamixTest2ModelTest >> testExport [

	self
		assert: (String streamContents: [ :s | group exportToMSEStream: s ])
		equals: '()'.
	group add: (FamixTest2Class named: 'Foo').
	self
		assert: (String streamContents: [ :s | group exportToMSEStream: s ])
		equals: '(
	(Famix-Test2-Entities.Class (id: 1)
		(name ''Foo'')
		(isStub false)
		(isTestCase false)
		(numberOfLinesOfCode 0)))'
]

{ #category : #tests }
FamixTest2ModelTest >> testPrintOn [

	self assert: group printString equals: 'a FamixTest2Model #noname(0)'.
	group name: 'hello'.
	self assert: group printString equals: 'a FamixTest2Model #hello(0)'.
	group name: 'hello2'.
	group add: MooseEntity new.
	self assert: group printString equals: 'a FamixTest2Model #hello2(1)'.
	self
		assert: self actualClass metamodel printString
		equals: 'a FMMetaModel'
]

{ #category : #tests }
FamixTest2ModelTest >> testRootUniqueness [
	self skip. "This should be fixed later. https://github.com/moosetechnology/Moose/issues/1809"
	super testRootUniqueness
]
