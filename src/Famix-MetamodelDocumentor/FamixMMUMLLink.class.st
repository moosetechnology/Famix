Class {
	#name : #FamixMMUMLLink,
	#superclass : #Object,
	#instVars : [
		'source',
		'target'
	],
	#category : #'Famix-MetamodelDocumentor-Model'
}

{ #category : #'instance creation' }
FamixMMUMLLink class >> from: aFMSource to: aFMTarget [

	^self new
		initializeFrom: aFMSource to: aFMTarget ;
		yourself
]

{ #category : #initialization }
FamixMMUMLLink >> initializeFrom: aFMSource to: aFMTarget [

		self source: aFMSource name.
		self target: aFMTarget name

]

{ #category : #accessing }
FamixMMUMLLink >> source [

	^ source
]

{ #category : #accessing }
FamixMMUMLLink >> source: anObject [

	source := anObject
]

{ #category : #accessing }
FamixMMUMLLink >> target [

	^ target
]

{ #category : #accessing }
FamixMMUMLLink >> target: anObject [

	target := anObject
]
