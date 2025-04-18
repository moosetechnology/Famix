Class {
	#name : #MooseEntityTest,
	#superclass : #MooseObjectTest,
	#category : #'Moose-Core-Tests'
}

{ #category : #helpers }
MooseEntityTest >> actualClass [
	^ MooseEntity
]

{ #category : #tests }
MooseEntityTest >> testAnnotation [
	| methodProperty |
	self actualClass allSubclassesDo: [ :cls | self assert: cls annotation identicalTo: cls ].

	self assert: self actualClass annotation identicalTo: MooseEntity.

	methodProperty := (self actualClass class >> #annotation) properties.
	self assert: (methodProperty includesKey: #abstract)
]

{ #category : #tests }
MooseEntityTest >> testLocalMooseModel [
	| element model |
	element := self actualClass new.
	model := MooseModel new.

	"self assert: (element mooseModel isNil)."
	model add: element.
	self assert: element mooseModel identicalTo: model.
	self assert: element localMooseModel identicalTo: model.

	model := MooseModel new.
	self assert: model localMooseModel identicalTo: model
]

{ #category : #tests }
MooseEntityTest >> testMooseModel [
	| element model |
	element := self actualClass new.
	model := MooseModel new.

	model add: element.
	self assert: element mooseModel identicalTo: model
]

{ #category : #tests }
MooseEntityTest >> testMooseModelAccessor [
	| entity model |
	entity := self actualClass new.
	"	self assert: (MooseModel ownerOf: entity) isNil. 
	self assert: (entity mooseModel isNil).
"
	model := MooseModel new.
	self assertEmpty: model.
	entity mooseModel: model.
	self assert: entity mooseModel identicalTo: model.
	self denyEmpty: model
]

{ #category : #tests }
MooseEntityTest >> testPrintOn [
	| entity printString |
	entity := self actualClass new.
	printString := String streamContents: [ :stream | entity printOn: stream ].
	self assert: printString equals: entity printString.
	self assert: (printString beginsWith: 'a MooseEntity ')
]

{ #category : #tests }
MooseEntityTest >> testPrivateSetMooseModel [
	| entity model |
	entity := self actualClass new.
	model := MooseModel new.
	entity privateSetMooseModel: model.
	self assert: entity mooseModel identicalTo: model
]
