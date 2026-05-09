"
Represents a property containing a ""primitive"" type: String, Number, Boolean
"
Class {
	#name : 'FmxMBTypedProperty',
	#superclass : 'FmxMBProperty',
	#instVars : [
		'propertyType',
		'multivalued',
		'defaultValue'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visitor' }
FmxMBTypedProperty >> acceptVisitor: aVisitor [

	^ aVisitor visitTypedProperty: self.
]

{ #category : 'accessing' }
FmxMBTypedProperty >> defaultValue [
	^ defaultValue
]

{ #category : 'accessing' }
FmxMBTypedProperty >> defaultValue: aValue [
	defaultValue := aValue
]

{ #category : 'generating' }
FmxMBTypedProperty >> generateGetterIn: aFmxBehavioral [

	aFmxBehavioral addMethod: (FmxMBMethodsFactory getTypedProperty: self) protocol: (self isRemote
			 ifTrue: [ '*' , self builder parentBuilderPackageName ]
			 ifFalse: [ #accessing ])
]

{ #category : 'generating' }
FmxMBTypedProperty >> generateSetterIn: aFmxBehavioral [

	aFmxBehavioral addMethod: (FmxMBMethodsFactory setTypedProperty: self name remote: self isRemote) protocol: (self isRemote
			 ifTrue: [ '*' , self builder parentBuilderPackageName ]
			 ifFalse: [ 'accessing' ])
]

{ #category : 'generating' }
FmxMBTypedProperty >> hasDefaultValue [
	^ defaultValue isNotNil
]

{ #category : 'initialization' }
FmxMBTypedProperty >> initialize [
	super initialize.
	multivalued := false
]

{ #category : 'accessing' }
FmxMBTypedProperty >> isMultivalued [

	^ multivalued
]

{ #category : 'accessing' }
FmxMBTypedProperty >> multivalued [
	multivalued := true
]

{ #category : 'accessing' }
FmxMBTypedProperty >> multivalued: anObject [
	multivalued := anObject
]

{ #category : 'accessing' }
FmxMBTypedProperty >> propertyType [
	^ propertyType
]

{ #category : 'accessing' }
FmxMBTypedProperty >> propertyType: anObject [
	propertyType := anObject
]

{ #category : 'generating' }
FmxMBTypedProperty >> slotExpression [

	^ self defaultValue
		  ifNil: [ 'FMProperty' ]
		  ifNotNil: [ :value | 'FMProperty defaultValue: ' , value printString ]
]

{ #category : 'generating' }
FmxMBTypedProperty >> validate [

	self propertyType ifNil: [ FmxMBIncompletePropertyDefiniton signal ]
]
