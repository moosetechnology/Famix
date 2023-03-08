Class {
	#name : #FmxMBStandardRelationSideGenerationStrategy,
	#superclass : #FmxMBRelationSideGenerationStrategy,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #generation }
FmxMBStandardRelationSideGenerationStrategy >> generateGetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [

	aStream
		tab;
		nextPutAll: '^ ';
		nextPutAll: aRelationSide name
]

{ #category : #generation }
FmxMBStandardRelationSideGenerationStrategy >> generateSetterCoreIn: aClassOrTrait on: aStream for: aRelationSide [

	aStream
		tab;
		nextPutAll: aRelationSide name.
	aRelationSide isOne
		ifTrue: [ aStream nextPutAll: ' := anObject' ]
		ifFalse: [ aStream nextPutAll: ' value: anObject' ]
]

{ #category : #testing }
FmxMBStandardRelationSideGenerationStrategy >> producesSlot [

	^ true
]
