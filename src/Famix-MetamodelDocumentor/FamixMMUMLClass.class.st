"
I represent a Famix class or trait belonging to a UML model

"
Class {
	#name : #FamixMMUMLClass,
	#superclass : #Object,
	#instVars : [
		'name',
		'color',
		'marker',
		'hide',
		'properties'
	],
	#category : #'Famix-MetamodelDocumentor-Model'
}

{ #category : #'instance creation' }
FamixMMUMLClass class >> from: aFM3Class [
	^self new
		initializeFrom: aFM3Class ;
		yourself
]

{ #category : #accessing }
FamixMMUMLClass >> addProperty: anObject [

	properties add: anObject
]

{ #category : #accessing }
FamixMMUMLClass >> color [

	^ color
]

{ #category : #accessing }
FamixMMUMLClass >> color: anObject [

	color := anObject
]

{ #category : #accessing }
FamixMMUMLClass >> hide [

	^ hide
]

{ #category : #accessing }
FamixMMUMLClass >> hide: anObject [

	hide := anObject
]

{ #category : #initialization }
FamixMMUMLClass >> initialize [

	super initialize.

	name := 'An-Unknown-Class'.
	hide := false.
	marker := $C.
	color := #LightYellow
]

{ #category : #initialization }
FamixMMUMLClass >> initializeFrom: aFM3Class [

	self name: aFM3Class name.
	aFM3Class isFM3Class
		ifTrue: [ self	marker: $C ]
		ifFalse: [  self	marker: $T ].

]

{ #category : #accessing }
FamixMMUMLClass >> marker [

	^ marker
]

{ #category : #accessing }
FamixMMUMLClass >> marker: anObject [

	marker := anObject
]

{ #category : #accessing }
FamixMMUMLClass >> name [

	^ name
]

{ #category : #accessing }
FamixMMUMLClass >> name: anObject [

	name := anObject
]

{ #category : #accessing }
FamixMMUMLClass >> properties [

	^ properties
]

{ #category : #accessing }
FamixMMUMLClass >> properties: anObject [

	properties := anObject
]
