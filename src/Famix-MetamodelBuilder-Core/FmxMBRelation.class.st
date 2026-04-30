"
FamixMetamodelBuilderRelation
"
Class {
	#name : 'FmxMBRelation',
	#superclass : 'Object',
	#instVars : [
		'side',
		'oppositeSide',
		'builder'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'accessing' }
FmxMBRelation >> builder [
	^ builder
]

{ #category : 'accessing' }
FmxMBRelation >> builder: anObject [
	builder := anObject
]

{ #category : 'accessing' }
FmxMBRelation >> from [

	^ side 
]

{ #category : 'accessing' }
FmxMBRelation >> from: aBlock [

	side := (FmxMBRelationSide new
		relation: self;
		builder: self builder;
		yourself).
	aBlock cull: side.
]

{ #category : 'accessing' }
FmxMBRelation >> left [

	^ side 
]

{ #category : 'accessing' }
FmxMBRelation >> oppositeRelation [

	^ self copy swapSides
]

{ #category : 'accessing' }
FmxMBRelation >> oppositeSide [
	^ oppositeSide
]

{ #category : 'accessing' }
FmxMBRelation >> oppositeSide: anObject [
	oppositeSide := anObject
]

{ #category : 'accessing' }
FmxMBRelation >> right [

	^ oppositeSide 
]

{ #category : 'accessing' }
FmxMBRelation >> shortCardinalityString [
	^ self from isMany ifTrue: [ '*' ] ifFalse: [ '' ]
]

{ #category : 'accessing' }
FmxMBRelation >> side [

	^ side
]

{ #category : 'accessing' }
FmxMBRelation >> side: anObject [
	side := anObject
]

{ #category : 'accessing' }
FmxMBRelation >> sides [

	^ { side. oppositeSide }
]

{ #category : 'accessing' }
FmxMBRelation >> swapSides [

	| temp |
	temp := oppositeSide.
	oppositeSide := side.
	side := temp
]

{ #category : 'accessing' }
FmxMBRelation >> to [

	^ oppositeSide 
]

{ #category : 'accessing' }
FmxMBRelation >> to: aBlock [

	oppositeSide := (FmxMBRelationSide new
		relation: self;
		builder: self builder;
		yourself).
	aBlock cull: oppositeSide.
]
