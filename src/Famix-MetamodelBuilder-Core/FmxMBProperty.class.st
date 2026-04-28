Class {
	#name : 'FmxMBProperty',
	#superclass : 'FmxMBEntity',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'testing' }
FmxMBProperty class >> isAbstract [
	^ self = FmxMBProperty
]

{ #category : 'accessing' }
FmxMBProperty >> asRGSlot [

	<ignoreForCoverage>
	self subclassResponsibility
]

{ #category : 'generating' }
FmxMBProperty >> generateAccessorsIn: aFmxBehavioral [
	self generateGetterIn: aFmxBehavioral.
	self generateSetterIn: aFmxBehavioral
]

{ #category : 'generating' }
FmxMBProperty >> generateGetterIn: aFmxBehavioral [
	<ignoreForCoverage>
	self subclassResponsibility
]

{ #category : 'generating' }
FmxMBProperty >> generateSetterIn: aFmxBehavioral [
	<ignoreForCoverage>
	self subclassResponsibility
]

{ #category : 'printing' }
FmxMBProperty >> hasDefaultValue [
	^ false
]

{ #category : 'initialization' }
FmxMBProperty >> initialize [
	super initialize.
	comment := ''
]

{ #category : 'printing' }
FmxMBProperty >> isContainer [
	^ false
]

{ #category : 'accessing' }
FmxMBProperty >> isRelation [

	^ false
]

{ #category : 'accessing' }
FmxMBProperty >> name: aString [
	(self builder reservedKeywords includes: aString) ifTrue: [ FmxMBPropertyNameIsReserved signal ].
	name := aString
]

{ #category : 'printing' }
FmxMBProperty >> printOn: aStream [
	<ignoreForCoverage>
	super printOn: aStream.
	self name
		ifNotNil: [ :n | 
			aStream
				nextPut: $(;
				nextPutAll: n;
				nextPut: $) ]
]

{ #category : 'printing' }
FmxMBProperty >> producesSlot [
	^ true
]

{ #category : 'accessing' }
FmxMBProperty >> slotDefinition [

	^ '#' , self name , ' => ' , self slotExpression
]

{ #category : 'accessing' }
FmxMBProperty >> slotExpression [

	self subclassResponsibility
]

{ #category : 'validation' }
FmxMBProperty >> validate [

	self subclassResponsibility
]
