"
I will generate accessors accessing a slot for a relation.

This is useful when both sides of the relation are non remote.
"
Class {
	#name : 'FmxMBRelationSlotsGenerationStrategy',
	#superclass : 'FmxMBRelationAccessorsGenerationStrategy',
	#category : 'Famix-MetamodelBuilder-Core-Generation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Generation'
}

{ #category : 'generation' }
FmxMBRelationSlotsGenerationStrategy >> generateGetterCoreOn: aStream for: aRelation [

	aStream
		tab;
		nextPutAll: '^ ';
		nextPutAll: aRelation name
]

{ #category : 'generation' }
FmxMBRelationSlotsGenerationStrategy >> generateSetterCoreOn: aStream for: aRelation [

	aStream
		tab;
		nextPutAll: aRelation name.
	aRelation isOne
		ifTrue: [ aStream nextPutAll: ' := anObject' ]
		ifFalse: [ aStream nextPutAll: ' value: anObject' ]
]
