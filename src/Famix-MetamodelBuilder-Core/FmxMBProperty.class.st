Class {
	#name : #FmxMBProperty,
	#superclass : #FmxMBEntity,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #testing }
FmxMBProperty class >> isAbstract [
	^ self = FmxMBProperty
]

{ #category : #accessing }
FmxMBProperty >> asSlot [

	<ignoreForCoverage>
	self subclassResponsibility
]

{ #category : #generating }
FmxMBProperty >> generateAccessorsIn: aClassOrTrait [
	self generateGetterIn: aClassOrTrait.
	self generateSetterIn: aClassOrTrait
]

{ #category : #generating }
FmxMBProperty >> generateGetterIn: aClassOrTrait [
	<ignoreForCoverage>
	self subclassResponsibility
]

{ #category : #generating }
FmxMBProperty >> generateSetterIn: aClassOrTrait [
	<ignoreForCoverage>
	self subclassResponsibility
]

{ #category : #printing }
FmxMBProperty >> hasDefaultValue [
	^ false
]

{ #category : #initialization }
FmxMBProperty >> initialize [
	super initialize.
	comment := ''
]

{ #category : #printing }
FmxMBProperty >> isContainer [
	^ false
]

{ #category : #accessing }
FmxMBProperty >> isRelation [

	^ false
]

{ #category : #accessing }
FmxMBProperty >> name: aString [
	(self builder reservedKeywords includes: aString) ifTrue: [ FmxMBPropertyNameIsReserved signal ].
	name := aString
]

{ #category : #printing }
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

{ #category : #printing }
FmxMBProperty >> producesSlot [
	^ true
]
