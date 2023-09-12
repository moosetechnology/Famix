Class {
	#name : #FamixMMUMLProperty,
	#superclass : #Object,
	#instVars : [
		'name',
		'type'
	],
	#category : #'Famix-MetamodelDocumentor-Model'
}

{ #category : #'instance creation' }
FamixMMUMLProperty class >> from: aFM3Property [
	^self new
		initializeFrom: aFM3Property ;
		yourself

]

{ #category : #initialization }
FamixMMUMLProperty >> initializeFrom: aFM3Property [

	self name: aFM3Property name.
	self type: aFM3Property type name

]

{ #category : #accessing }
FamixMMUMLProperty >> name [

	^ name
]

{ #category : #accessing }
FamixMMUMLProperty >> name: anObject [

	name := anObject
]

{ #category : #accessing }
FamixMMUMLProperty >> type [

	^ type
]

{ #category : #accessing }
FamixMMUMLProperty >> type: anObject [

	type := anObject
]
