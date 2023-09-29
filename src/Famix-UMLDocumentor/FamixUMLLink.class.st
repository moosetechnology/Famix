Class {
	#name : #FamixUMLLink,
	#superclass : #Object,
	#instVars : [
		'source',
		'target'
	],
	#category : #'Famix-UMLDocumentor-Model'
}

{ #category : #'instance creation' }
FamixUMLLink class >> from: aFMSource to: aFMTarget [

	^self new
		initializeFrom: aFMSource to: aFMTarget ;
		yourself
]

{ #category : #initialization }
FamixUMLLink >> initializeFrom: aFMSource to: aFMTarget [

		self source: aFMSource name.
		self target: aFMTarget name

]

{ #category : #accessing }
FamixUMLLink >> source [

	^ source
]

{ #category : #accessing }
FamixUMLLink >> source: anObject [

	source := anObject
]

{ #category : #accessing }
FamixUMLLink >> target [

	^ target
]

{ #category : #accessing }
FamixUMLLink >> target: anObject [

	target := anObject
]
