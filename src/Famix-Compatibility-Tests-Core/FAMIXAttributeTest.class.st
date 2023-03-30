Class {
	#name : #FAMIXAttributeTest,
	#superclass : #FAMIXNamedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXAttributeTest >> actualClass [
	^ FAMIXAttribute
]

{ #category : #helpers }
FAMIXAttributeTest >> testCanBeTransient [
	| method |
	method := self actualClass new.
	self deny: method isTransient.
	method isTransient: true.
	self assert: method isTransient
]

{ #category : #helpers }
FAMIXAttributeTest >> testCanBeVolatile [
	| method |
	method := self actualClass new.
	self deny: method isVolatile.
	method isVolatile: true.
	self assert: method isVolatile
]

{ #category : #helpers }
FAMIXAttributeTest >> testImportTransient [
	| model |
	model := '((FAMIX.Attribute (id: 1) (isTransient true)))'
		readStreamDo: [ :stream | FAMIXModel importFromMSEStream: stream ].
	self assert: model anyOne isTransient
]

{ #category : #helpers }
FAMIXAttributeTest >> testImportVolatile [
	| model |
	model := '((FAMIX.Attribute (id: 1) (isVolatile true)))'
		readStreamDo: [ :stream | FAMIXModel importFromMSEStream: stream ].
	self assert: model anyOne isVolatile
]
