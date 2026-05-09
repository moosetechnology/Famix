"
I will generate accessors accessing a slot for a relation.

This is useful when both sides of the relation are non remote.
"
Class {
	#name : 'FmxMBRelationSlotsGenerationStrategy',
	#superclass : 'FmxMBRelationAccessorsGenerationStrategy',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'generation' }
FmxMBRelationSlotsGenerationStrategy >> generateGetterCoreOn: aStream for: aRelationSide [

	aStream
		tab;
		nextPutAll: '^ ';
		nextPutAll: aRelationSide name
]

{ #category : 'generation' }
FmxMBRelationSlotsGenerationStrategy >> generateSetterCoreOn: aStream for: aRelationSide [

	aStream
		tab;
		nextPutAll: aRelationSide name.
	aRelationSide isOne
		ifTrue: [ aStream nextPutAll: ' := anObject' ]
		ifFalse: [ aStream nextPutAll: ' value: anObject' ]
]

{ #category : 'testing' }
FmxMBRelationSlotsGenerationStrategy >> producesSlot [

	^ true
]
