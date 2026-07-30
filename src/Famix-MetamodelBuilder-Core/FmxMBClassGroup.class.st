Class {
	#name : 'FmxMBClassGroup',
	#superclass : 'FmxMBClass',
	#instVars : [
		'innerClass'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visitor' }
FmxMBClassGroup >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitClassGroup: self
]

{ #category : 'settings - default' }
FmxMBClassGroup >> defaultSuperclassName [

	^ #MooseSpecializedGroup
]

{ #category : 'settings - default' }
FmxMBClassGroup >> defaultTag [

	^ #Groups
]

{ #category : 'accessing' }
FmxMBClassGroup >> innerClass [
	^ innerClass
]

{ #category : 'accessing' }
FmxMBClassGroup >> innerClass: anObject [
	innerClass := anObject
]

{ #category : 'testing' }
FmxMBClassGroup >> isMetamodelClassGroup [
	^ true
]

{ #category : 'settings - default' }
FmxMBClassGroup >> name [
	"I am override to avoid the presence of the T in the generated class"

	^ self innerClass isMetamodelClass
		ifTrue: [ super name ]
		ifFalse: [ "So my inner class is a metamodel Trait" super name withoutPrefix: #T ]
]
