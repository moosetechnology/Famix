Class {
	#name : #FAMIXMethodTest,
	#superclass : #FAMIXNamedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXMethodTest >> actualClass [
	^ FAMIXMethod
]

{ #category : #testing }
FAMIXMethodTest >> testCanBeSynchronized [
	| method |
	method := self actualClass new.
	self deny: method isSynchronized.
	method isSynchronized: true.
	self assert: method isSynchronized
]

{ #category : #testing }
FAMIXMethodTest >> testImportSynchronized [
	| model |
	model := '((FAMIX.Method (id: 1) (isSynchronized true)))'
		readStreamDo: [ :stream | FAMIXModel importFromMSEStream: stream ].
	self assert: model anyOne isSynchronized
]

{ #category : #testing }
FAMIXMethodTest >> testIsConstructor [
	self
		assert:
			(self actualClass new
				isConstructor: true;
				isConstructor).
	self
		deny:
			(self actualClass new
				isConstructor: true;
				isConstructor: false;
				isConstructor).
	self
		assert:
			(self actualClass new
				isConstructor: true;
				isConstructor: false;
				isConstructor: true;
				isConstructor)
]

{ #category : #testing }
FAMIXMethodTest >> testIsConstructorByKind [
	self assert: (self actualClass new kind: 'constructor'; isConstructor)
]
