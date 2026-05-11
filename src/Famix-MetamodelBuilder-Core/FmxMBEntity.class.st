Class {
	#name : 'FmxMBEntity',
	#superclass : 'Object',
	#instVars : [
		'name',
		'comment',
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

{ #category : 'accessing' }
FmxMBEntity >> additionalProperties [

	^ additionalProperties 
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
	additionalProperties := Dictionary new.
	isRemote := false.
]

{ #category : 'testing' }
FmxMBEntity >> isClassEntity [

	^ false
]

{ #category : 'testing' }
FmxMBEntity >> isConcreteClass [

	^ false
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
FmxMBEntity >> reservedKeywords [

	^ { #class }
]
