Class {
	#name : #FamixUMLProperty,
	#superclass : #Object,
	#instVars : [
		'name',
		'type'
	],
	#category : #'Famix-UMLDocumentor-Model'
}

{ #category : #'instance creation' }
FamixUMLProperty class >> from: aFM3Property [
	^self new
		initializeFrom: aFM3Property ;
		yourself

]

{ #category : #initialization }
FamixUMLProperty >> initializeFrom: aFM3Property [

	self name: aFM3Property name.
	self type: aFM3Property type name

]

{ #category : #accessing }
FamixUMLProperty >> name [

	^ name
]

{ #category : #accessing }
FamixUMLProperty >> name: anObject [

	name := anObject
]

{ #category : #accessing }
FamixUMLProperty >> type [

	^ type
]

{ #category : #accessing }
FamixUMLProperty >> type: anObject [

	type := anObject
]
