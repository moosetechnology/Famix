Class {
	#name : #FamixMMUMLAssociation,
	#superclass : #FamixMMUMLLink,
	#instVars : [
		'sourceCardinality',
		'sourceRole',
		'targetRole',
		'targetCardinality',
		'aggregation'
	],
	#category : #'Famix-MetamodelDocumentor-Model'
}

{ #category : #'instance creation' }
FamixMMUMLAssociation class >> from: aFM3Prop [
	^self new
		initializeFrom: aFM3Prop ;
		yourself

]

{ #category : #accessing }
FamixMMUMLAssociation >> aggregation [

	^ aggregation
]

{ #category : #accessing }
FamixMMUMLAssociation >> aggregation: anObject [

	aggregation := anObject
]

{ #category : #initialization }
FamixMMUMLAssociation >> initialize [ 
	super initialize.
	
	sourceCardinality := ''.
	targetCardinality := ''.

	sourceRole := ''.
	targetRole := ''.
	
	aggregation := nil
]

{ #category : #initialization }
FamixMMUMLAssociation >> initializeFrom: aFM3Prop [
	self source: aFM3Prop mmClass name.
	aFM3Prop isMultivalued ifTrue: [ self sourceCardinality: '*' ].
	self sourceRole: aFM3Prop name.
	aFM3Prop isContainer ifTrue: [ self aggregation: #source ].
	self target: aFM3Prop type name.

	aFM3Prop hasOpposite ifFalse: [ ^self ].

	self targetRole: aFM3Prop opposite name.
	aFM3Prop opposite isMultivalued
		ifTrue: [ self targetCardinality: '*' ].
	aFM3Prop opposite isContainer ifTrue: [ self aggregation: #target ].


]

{ #category : #accessing }
FamixMMUMLAssociation >> sourceCardinality [

	^ sourceCardinality
]

{ #category : #accessing }
FamixMMUMLAssociation >> sourceCardinality: anObject [

	sourceCardinality := anObject
]

{ #category : #accessing }
FamixMMUMLAssociation >> sourceRole [

	^ sourceRole
]

{ #category : #accessing }
FamixMMUMLAssociation >> sourceRole: anObject [

	sourceRole := anObject
]

{ #category : #accessing }
FamixMMUMLAssociation >> targetCardinality [

	^ targetCardinality
]

{ #category : #accessing }
FamixMMUMLAssociation >> targetCardinality: anObject [

	targetCardinality := anObject
]

{ #category : #accessing }
FamixMMUMLAssociation >> targetRole [

	^ targetRole
]

{ #category : #accessing }
FamixMMUMLAssociation >> targetRole: anObject [

	targetRole := anObject
]
