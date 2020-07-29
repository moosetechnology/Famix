Class {
	#name : #MooseSpecializedGroupTest,
	#superclass : #MooseGroupTest,
	#category : #'Moose-Core-Tests'
}

{ #category : #helpers }
MooseSpecializedGroupTest >> actualClass [
	^ MooseSpecializedGroup
]

{ #category : #tests }
MooseSpecializedGroupTest >> testAllModelMethod [
	| model |
	model := self twoClasses.
	self assert: model allModelMethods entities size equals: 3.
	self assert: (model allModelMethods entities includesAll: model allMethods entities).
	self flag: #todo. "Once this bug will be fixed, we should add an assertion with stubs methods.https://github.com/moosetechnology/Moose/issues/1800"
]
