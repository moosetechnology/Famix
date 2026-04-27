Class {
	#name : 'FmxMBEntity',
	#superclass : 'Object',
	#instVars : [
		'name',
		'comment',
		'builder',
		'willGenerate',
		'additionalProperties',
		'isRemote'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visiting' }
FmxMBEntity >> acceptVisitor: aVisitor [
	^ self subclassResponsibility
]

{ #category : 'generating' }
FmxMBEntity >> addMethod: code in: class classSide: boolean protocol: protocol [

	self flag: #todo. "Demeter"
	self builder environment
		addMethod: code
		in: class name
		classSide: boolean
		protocol: protocol.

	self flag: #todo. "This code should never make it in the dev branch of Famix. Also we should provide the class name directly"
	(boolean
		 ifTrue: [ class classSide ]
		 ifFalse: [ class ]) compile: code classified: protocol
]

{ #category : 'generating' }
FmxMBEntity >> addMethod: code in: class protocol: protocol [

	^ self addMethod: code in: class classSide: false protocol: protocol
]

{ #category : 'accessing' }
FmxMBEntity >> additionalProperties [

	^ additionalProperties 
]

{ #category : 'accessing' }
FmxMBEntity >> builder [
	^ builder
]

{ #category : 'accessing' }
FmxMBEntity >> builder: anObject [
	builder := anObject
]

{ #category : 'accessing' }
FmxMBEntity >> comment [
	^ comment
]

{ #category : 'accessing' }
FmxMBEntity >> comment: anObject [
	comment := anObject
]

{ #category : 'initialization' }
FmxMBEntity >> initialize [

	super initialize.	

	comment := String new.
	willGenerate := true.
	additionalProperties := Dictionary new.
	isRemote := false.
]

{ #category : 'accessing' }
FmxMBEntity >> isRemote [ 

	^ isRemote
]

{ #category : 'accessing' }
FmxMBEntity >> isRemote: anObject [
	isRemote := anObject
]

{ #category : 'accessing' }
FmxMBEntity >> name [
	^ name
]

{ #category : 'accessing' }
FmxMBEntity >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
FmxMBEntity >> remoteBuilder [

	^ self additionalProperties at: #remoteBuilder ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FmxMBEntity >> remoteBuilder: aRemoteBuilder [

	self additionalProperties at: #remoteBuilder put: aRemoteBuilder
]

{ #category : 'accessing' }
FmxMBEntity >> willGenerate [
	^ willGenerate
]

{ #category : 'accessing' }
FmxMBEntity >> willGenerate: anObject [
	willGenerate := anObject
]
