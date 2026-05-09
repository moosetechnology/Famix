"
I will generate accessors using the Moose concept of attributes to access a relation.

This is used when one of the side of the relation is remote.
"
Class {
	#name : 'FmxMBRelationAttributesGenerationStrategy',
	#superclass : 'FmxMBRelationAccessorsGenerationStrategy',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'generation' }
FmxMBRelationAttributesGenerationStrategy >> generateGetterCoreOn: aStream for: aRelationSide [

	aStream
		tab;
		nextPutAll: ('<FMProperty: #{1} type: #{2} opposite: #{3}>' format: {
						 aRelationSide name.
						 aRelationSide oppositeType.
						 aRelationSide oppositeName });
		cr.

	"We need to add the multivalued since we do not use a FMMany slot."
	aRelationSide isMany ifTrue: [
			aStream
				tab;
				nextPutAll: '<multivalued>';
				cr ].

	aRelationSide remoteBuilderDo: [ :aRemoteBuilder |
			aStream
				tab;
				nextPutAll: ('<package: #''{1}''>' format: { aRemoteBuilder generator packageName });
				cr ].

	aStream
		tab;
		nextPutAll: '^ self attributeAt: #';
		nextPutAll: aRelationSide name.

	aRelationSide isOne ifTrue: [ aStream nextPutAll: ' ifAbsent: [ nil ]' ].

	(aRelationSide oppositeSide isOne and: [ aRelationSide isMany ]) ifTrue: [
		aStream nextPutAll: (' ifAbsentPut: [ FMMultivalueLink on: self opposite: #{1}: ]' format: { aRelationSide oppositeSide name }) ].

	(aRelationSide isMany and: [ aRelationSide oppositeSide isMany ]) ifTrue: [
		aStream nextPutAll: (' ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #{1} ]' format: { aRelationSide oppositeSide name }) ]
]

{ #category : 'generation' }
FmxMBRelationAttributesGenerationStrategy >> generateSetterCoreOn: aStream for: aRelationSide [

	aRelationSide remoteBuilderDo: [ :aRemoteBuilder |
			aStream
				tab;
				nextPutAll: ('<package: #''{1}''>' format: { aRemoteBuilder generator packageName });
				cr;
				cr ].

	(aRelationSide isOne and: [ aRelationSide oppositeSide isOne ]) ifTrue: [
			aStream
				tab;
				nextPutAll: ('(self attributeAt: #{1} ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].' format: { aRelationSide name });
				cr;
				tab;
				nextPutAll: 'anObject ifNil: [ | otherSide |';
				cr;
				tab;
				tab;
				nextPutAll: ('otherSide :=  self {1}.' format: { aRelationSide name });
				cr;
				tab;
				tab;
				nextPutAll: ('self attributeAt: #{1} put: anObject.' format: { aRelationSide name });
				cr;
				tab;
				tab;
				nextPutAll: ('otherSide {1}: nil ]' format: { aRelationSide oppositeSide name });
				cr;
				tab;
				nextPutAll: ('ifNotNil: [ ' format: { aRelationSide oppositeSide name });
				cr;
				tab;
				tab;
				nextPutAll: ('self attributeAt: #{1} put: anObject.' format: { aRelationSide name });
				cr;
				tab;
				tab;
				nextPutAll: ('anObject {1}: self ]' format: { aRelationSide oppositeSide name }) ].

	aRelationSide isMany ifTrue: [
			aStream
				tab;
				nextPutAll: ('self {1} value: anObject' format: { aRelationSide name }) ].

	(aRelationSide oppositeSide isMany and: [ aRelationSide isOne ]) ifTrue: [
			aStream
				tab;
				nextPutAll: ('self attributeAt: #{1} put: (FMMultivalueLink on: self update: #{2} from: self {1} to: anObject).' format: {
								 aRelationSide name.
								 aRelationSide oppositeSide name }) ]
]
