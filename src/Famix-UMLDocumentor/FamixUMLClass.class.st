"
I represent a Famix class or trait belonging to a UML model

"
Class {
	#name : #FamixUMLClass,
	#superclass : #Object,
	#instVars : [
		'name',
		'color',
		'backgroundColor',
		'hide',
		'properties',
		'isTrait'
	],
	#category : #'Famix-UMLDocumentor-Model'
}

{ #category : #'instance creation' }
FamixUMLClass class >> from: aFM3Class [
	^self new
		initializeFrom: aFM3Class ;
		yourself
]

{ #category : #accessing }
FamixUMLClass >> addProperty: anObject [

	properties add: anObject
]

{ #category : #accessing }
FamixUMLClass >> backgroundColor [

	^ backgroundColor
]

{ #category : #accessing }
FamixUMLClass >> backgroundColor: anObject [

	backgroundColor := anObject
]

{ #category : #accessing }
FamixUMLClass >> beTrait [

	isTrait := true
]

{ #category : #accessing }
FamixUMLClass >> color [

	^ color
]

{ #category : #accessing }
FamixUMLClass >> color: anObject [

	color := anObject
]

{ #category : #accessing }
FamixUMLClass >> hide [

	^ hide
]

{ #category : #accessing }
FamixUMLClass >> hide: anObject [

	hide := anObject
]

{ #category : #initialization }
FamixUMLClass >> initialize [

	super initialize.

	name := 'An-Unknown-Class'.
	hide := false.
	isTrait := false.
	color := #black.
	backgroundColor := #lightYellow.
	properties := OrderedCollection new
]

{ #category : #initialization }
FamixUMLClass >> initializeFrom: aFM3Class [

	self name: aFM3Class name.
	aFM3Class isFM3Class
		ifFalse: [ self beTrait ].

]

{ #category : #accessing }
FamixUMLClass >> isTrait: aBoolean [

	isTrait := aBoolean 
]

{ #category : #accessing }
FamixUMLClass >> name [

	^ name
]

{ #category : #accessing }
FamixUMLClass >> name: anObject [

	name := anObject
]

{ #category : #accessing }
FamixUMLClass >> properties [

	^ properties
]

{ #category : #accessing }
FamixUMLClass >> properties: anObject [

	properties := anObject
]
