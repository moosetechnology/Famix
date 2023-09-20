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
FamixUMLAssociation >> aggregation: aSymbol [
	"#off, #source, or #target"

	self assert: ( #(off source target) includes: aSymbol ).
	aggregation := aSymbol
]

{ #category : #accessing }
FamixUMLAssociation >> checkCardinalitySymbol: aSymbol [

	self assert: ((aSymbol = #one) or: [ aSymbol = #multi ])
]

{ #category : #initialization }
FamixUMLAssociation >> initialize [ 
	super initialize.
	
	sourceCardinality := #one.
	targetCardinality := #one.
	
	aggregation := #off
]

{ #category : #initialization }
FamixUMLAssociation >> initializeFrom: aFM3Prop [

	self source: aFM3Prop mmClass name.
	aFM3Prop isMultivalued ifTrue: [ self sourceCardinality: #multi ].
	aFM3Prop isContainer ifTrue: [ self aggregation: #target ].

	self target: aFM3Prop type name.

	"an association might not have an opposite if it is inherited"
	(aFM3Prop hasOpposite) ifFalse: [ ^self ].

	aFM3Prop opposite isContainer ifTrue: [ self aggregation: #source ].

	self sourceRole: aFM3Prop opposite name.
	self targetRole: aFM3Prop name.

	aFM3Prop opposite isMultivalued ifTrue: [ self targetCardinality: #multi ].
	aFM3Prop opposite isContainer ifTrue: [ self aggregation: #target ].


]

{ #category : #accessing }
FamixUMLAssociation >> sourceCardinality [
	"#one or #multiple"

	^ sourceCardinality
]

{ #category : #accessing }
FamixUMLAssociation >> sourceCardinality: aSymbol [
	"#one or #multi"

	self checkCardinalitySymbol: aSymbol.
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
	"#one or #multi"

	self checkCardinalitySymbol: aSymbol.
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
