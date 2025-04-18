"
Represents a property containing a ""primitive"" type: String, Number, Boolean
"
Class {
	#name : #FmxMBTypedProperty,
	#superclass : #FmxMBProperty,
	#instVars : [
		'propertyType',
		'multivalued',
		'defaultValue'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visitor }
FmxMBTypedProperty >> acceptVisitor: aVisitor [

	^ aVisitor visitTypedProperty: self.
]

{ #category : #generating }
FmxMBTypedProperty >> asSlot [
	self propertyType ifNil: [ FmxMBIncompletePropertyDefiniton signal ].

	^ self builder environment slotNamed: self name asSymbol defaultValue: self defaultValue 
]

{ #category : #accessing }
FmxMBTypedProperty >> defaultValue [
	^ defaultValue
]

{ #category : #accessing }
FmxMBTypedProperty >> defaultValue: aValue [
	defaultValue := aValue
]

{ #category : #generating }
FmxMBTypedProperty >> generateGetterIn: aClassOrTrait [

	| methodSource propertyDefinition commentDefinition pragmaFormat |

	pragmaFormat := self defaultValue ifNil: [ '<FMProperty: #{1} type: #{2}>' ] 
											   ifNotNil: [ '<FMProperty: #{1} type: #{2} defaultValue: {3}>' ]. 
	propertyDefinition := pragmaFormat
		format: { self name. self propertyType. self defaultValue printString}.

	commentDefinition := self comment
		ifNotEmpty: [ '<FMComment: {1}>' format: { self comment printString } ].

	methodSource := String streamContents: [ :s |
		s nextPutAll: self name; cr; cr.
		s tab; nextPutAll: propertyDefinition; cr.
		s tab; nextPutAll: '<generated>'; cr.
		self isMultivalued ifTrue: [ 
			 s tab; nextPutAll: '<multivalued>'; cr. ].
		commentDefinition  
			ifNotEmpty: [ s tab; nextPutAll: commentDefinition; cr].
		s tab; nextPutAll: '^ '; nextPutAll: self name.
		self defaultValue ifNotNil: [
			s nextPutAll: (' ifNil: [ {1} := {2} ]' format: { self name. self defaultValue printString }) ] ].

	self builder environment compile: methodSource in: aClassOrTrait classified: 'accessing'.	
	

	
]

{ #category : #generating }
FmxMBTypedProperty >> generateSetterIn: aClassOrTrait [
	self builder environment
		compile:
			('{1}: anObject
	<generated>
	{1} := anObject' format: {self name})
		in: aClassOrTrait
		classified: 'accessing'
]

{ #category : #generating }
FmxMBTypedProperty >> hasDefaultValue [
	^ defaultValue isNotNil
]

{ #category : #initialization }
FmxMBTypedProperty >> initialize [
	super initialize.
	multivalued := false
]

{ #category : #accessing }
FmxMBTypedProperty >> isMultivalued [

	^ multivalued
]

{ #category : #accessing }
FmxMBTypedProperty >> multivalued [
	multivalued := true
]

{ #category : #accessing }
FmxMBTypedProperty >> multivalued: anObject [
	multivalued := anObject
]

{ #category : #accessing }
FmxMBTypedProperty >> propertyType [
	^ propertyType
]

{ #category : #accessing }
FmxMBTypedProperty >> propertyType: anObject [
	propertyType := anObject
]
