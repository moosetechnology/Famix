"
I am an abstract class that gathers visitors in order to generate a plantUML code of a meta model.

My main visitor is FamixMMUMLDocumentor. You can call it with different options to generate a plantUML code of your model.

Therefore, I group instance variables that are shared by these two visitors and methods to access them.
"
Class {
	#name : #FamixMMUMLAbstractDocumentor,
	#superclass : #Object,
	#instVars : [
		'model',
		'outputStream',
		'classesOfInterest',
		'externalClasses',
		'withStub'
	],
	#category : #'Famix-MetamodelDocumentor'
}

{ #category : #'api - generation' }
FamixMMUMLAbstractDocumentor >> beWithStub [
	self withStub: true
]

{ #category : #'api - generation' }
FamixMMUMLAbstractDocumentor >> beWithoutStub [
	self withStub: false
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> classesOfInterest: aCollection [
	classesOfInterest := aCollection 
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> externalClasses [
	^externalClasses 
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> externalClasses: aCollection [
	externalClasses  := aCollection 
]

{ #category : #generating }
FamixMMUMLAbstractDocumentor >> generateClassName: aFM3Class [
	outputStream
		nextPutAll: aFM3Class name.
	(self ofInterest: aFM3Class)
	ifFalse: [
		externalClasses add: aFM3Class 
	]
]

{ #category : #initialization }
FamixMMUMLAbstractDocumentor >> initialize [
	self beWithoutStub.
	externalClasses := Set new
]

{ #category : #testing }
FamixMMUMLAbstractDocumentor >> isWithStub [
	^withStub
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> model [
	^ model
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> model: anObject [
	model := anObject
]

{ #category : #private }
FamixMMUMLAbstractDocumentor >> ofInterest: aFMClass [
	^classesOfInterest includes: aFMClass
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> outputStream [
	^ outputStream
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> outputStream: anObject [
	outputStream := anObject
]

{ #category : #private }
FamixMMUMLAbstractDocumentor >> relationEndOfInterest: aFMClass [
	^self isWithStub
		ifTrue: [ aFMClass class ~= FM3Object ]
		ifFalse: [ self ofInterest: aFMClass ]
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> withStub: aBoolean [
	withStub := aBoolean
]
