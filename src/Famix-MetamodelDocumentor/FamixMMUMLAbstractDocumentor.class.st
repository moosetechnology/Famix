"
I am an abstract class that gathers visitors in order to generate a plantUML code of a meta model.

My main visitor is FamixMMUMLDocumentor. You can call it with different options to generate a plantUML code of your model.

Therefore, I group instance variables that are shared by these two visitors and methods to access them.
"
Class {
	#name : #FamixMMUMLAbstractDocumentor,
	#superclass : #Object,
	#instVars : [
		'outputStream',
		'classesOfInterest',
		'externalClasses',
		'withStub',
		'models'
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

{ #category : #'api - generation' }
FamixMMUMLAbstractDocumentor >> findDescriptionOf: anElement [

	models
		  detect: [ :model | 
			  ([ model model metamodel descriptionOf: anElement ]
				   on: NotFound
				   do: [ nil ]) isNotNil ]
		  ifFound: [ :model | ^ model model metamodel descriptionOf: anElement ]
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
	externalClasses := Set new.
	models := Set new.
]

{ #category : #testing }
FamixMMUMLAbstractDocumentor >> isWithStub [
	^withStub
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> model [
	^ models anyOne
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> model: aModel [

	self withModel: aModel
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> models [

	^ models
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> models: anObject [

	models := anObject
]

{ #category : #private }
FamixMMUMLAbstractDocumentor >> ofInterest: aFMClass [

	^ classesOfInterest anySatisfy: [ :fmClassOfInterest | fmClassOfInterest fullName = aFMClass fullName ]
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
FamixMMUMLAbstractDocumentor >> withModel: aModel [

	models add: (FamixUMLModelColorTuple model: aModel)
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> withModel: aModel andColor: aColor [

	models add: (FamixUMLModelColorTuple model: aModel color: aColor)
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> withStub: aBoolean [
	withStub := aBoolean
]
