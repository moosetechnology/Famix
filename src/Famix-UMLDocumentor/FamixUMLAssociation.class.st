Class {
	#name : #FamixUMLAssociation,
	#superclass : #FamixUMLLink,
	#instVars : [
		'sourceCardinality',
		'sourceRole',
		'targetRole',
		'targetCardinality',
		'aggregation'
	],
	#category : #'Famix-UMLDocumentor-Model'
}

{ #category : #'instance creation' }
FamixUMLAssociation class >> from: aFM3Prop [
	^self new
		initializeFrom: aFM3Prop ;
		yourself

]

{ #category : #accessing }
FamixUMLAssociation >> aggregation [

	^ aggregation
]

{ #category : #accessing }
FamixUMLAssociation >> aggregation: anObject [

	aggregation := anObject
]

{ #category : #initialization }
FamixUMLAssociation >> initialize [ 
	super initialize.
	
	sourceCardinality := #one.
	targetCardinality := #one.

	sourceRole := ''.
	targetRole := ''.
	
	aggregation := nil
]

{ #category : #initialization }
FamixUMLAssociation >> initializeFrom: aFM3Prop [
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
FamixUMLAssociation >> sourceCardinality [
	"#one or #multiple"

	^ sourceCardinality
]

{ #category : #accessing }
FamixUMLAssociation >> sourceCardinality: aSymbol [
	"#one or #multiple"

	sourceCardinality := aSymbol
]

{ #category : #accessing }
FamixUMLAssociation >> sourceRole [

	^ sourceRole
]

{ #category : #accessing }
FamixUMLAssociation >> sourceRole: anObject [

	sourceRole := anObject
]

{ #category : #accessing }
FamixUMLAssociation >> targetCardinality [
	"#one or #multiple"

	^ targetCardinality
]

{ #category : #accessing }
FamixUMLAssociation >> targetCardinality: aSymbol [
	"#one or #multiple"

	targetCardinality := aSymbol
]

{ #category : #accessing }
FamixUMLAssociation >> targetRole [

	^ targetRole
]

{ #category : #accessing }
FamixUMLAssociation >> targetRole: anObject [

	targetRole := anObject
]
