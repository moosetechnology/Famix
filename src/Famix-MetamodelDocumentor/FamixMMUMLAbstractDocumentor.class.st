"
I am an abstract class that gathers visitors in order to generate a plantUML code of a meta model.

My main visitor is FamixMMUMLDocumentor. You can call it with different options to generate a plantUML code of your model.

Therefore, I group instance variables that are shared by these two visitors and methods to access them.
"
Class {
	#name : #FamixMMUMLAbstractDocumentor,
	#superclass : #Object,
	#instVars : [
		'classesOfInterest',
		'externalClasses',
		'withStub',
		'models',
		'prefs'
	],
	#category : #'Famix-MetamodelDocumentor-Generate'
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

	models do: [ :modelColorTuple |
		^[ modelColorTuple model metamodel fmTypeOf: anElement ]
			on: NotFound
			do: [ nil ]
	]

]

{ #category : #generating }
FamixMMUMLAbstractDocumentor >> generateClassName: aFM3Class [
	outputStream
		nextPutAll: aFM3Class name.
	(self isOfInterest: aFM3Class)
	ifFalse: [
		externalClasses add: aFM3Class 
	]
]

{ #category : #initialization }
FamixMMUMLAbstractDocumentor >> initialize [
	super initialize.

	self beWithoutStub.
	classesOfInterest := Set new.
	externalClasses := Set new.
	models := Set new.
	prefs := Set new.
]

{ #category : #testing }
FamixMMUMLAbstractDocumentor >> isOfInterest: aFMClass [

	^classesOfInterest anySatisfy: [ :fmClassOfInterest |
		fmClassOfInterest fullName = aFMClass fullName ]
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

{ #category : #testing }
FamixMMUMLAbstractDocumentor >> relationEndOfInterest: aFMClass [
	^self isWithStub
		ifTrue: [ aFMClass class ~= FM3Object ]
		ifFalse: [ self isOfInterest: aFMClass ]
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
FamixMMUMLAbstractDocumentor >> withPreference: plantUMLStatement [

	prefs add: plantUMLStatement
]

{ #category : #accessing }
FamixMMUMLAbstractDocumentor >> withStub: aBoolean [
	withStub := aBoolean
]
