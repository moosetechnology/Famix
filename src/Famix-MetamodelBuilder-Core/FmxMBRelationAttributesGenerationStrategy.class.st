"
I will generate accessors using the Moose concept of attributes to access a relation.

This is used when one of the side of the relation is remote.
"
Class {
	#name : 'FmxMBRelationAttributesGenerationStrategy',
	#superclass : 'FmxMBRelationAccessorsGenerationStrategy',
	#category : 'Famix-MetamodelBuilder-Core-Generation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Generation'
}

{ #category : 'generation' }
FmxMBRelationAttributesGenerationStrategy >> generateGetterCoreOn: aStream for: aRelation [

	aStream
		tab;
		nextPutAll: ('<FMProperty: #{1} type: #{2} opposite: #{3}>' format: {
						 aRelation name.
						 aRelation oppositeType.
						 aRelation oppositeName });
		cr.

	"We need to add the multivalued since we do not use a FMMany slot."
	aRelation isMany ifTrue: [
			aStream
				tab;
				nextPutAll: '<multivalued>';
				cr ].

	aRelation remoteBuilderDo: [ :aRemoteBuilder |
			aStream
				tab;
				nextPutAll: ('<package: #''{1}''>' format: { aRemoteBuilder generator packageName });
				cr ].

	aStream
		tab;
		nextPutAll: '^ self attributeAt: #';
		nextPutAll: aRelation name.

	aRelation isOne ifTrue: [ aStream nextPutAll: ' ifAbsent: [ nil ]' ].

	(aRelation oppositeSide isOne and: [ aRelation isMany ]) ifTrue: [
		aStream nextPutAll: (' ifAbsentPut: [ FMMultivalueLink on: self opposite: #{1}: ]' format: { aRelation oppositeSide name }) ].

	(aRelation isMany and: [ aRelation oppositeSide isMany ]) ifTrue: [
		aStream nextPutAll: (' ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #{1} ]' format: { aRelation oppositeSide name }) ]
]

{ #category : 'generation' }
FmxMBRelationAttributesGenerationStrategy >> generateSetterCoreOn: aStream for: aRelation [

	aRelation remoteBuilderDo: [ :aRemoteBuilder |
			aStream
				tab;
				nextPutAll: ('<package: #''{1}''>' format: { aRemoteBuilder generator packageName });
				cr;
				cr ].

	(aRelation isOne and: [ aRelation oppositeSide isOne ]) ifTrue: [
			aStream
				tab;
				nextPutAll: ('(self attributeAt: #{1} ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].' format: { aRelation name });
				cr;
				tab;
				nextPutAll: 'anObject ifNil: [ | otherSide |';
				cr;
				tab;
				tab;
				nextPutAll: ('otherSide :=  self {1}.' format: { aRelation name });
				cr;
				tab;
				tab;
				nextPutAll: ('self attributeAt: #{1} put: anObject.' format: { aRelation name });
				cr;
				tab;
				tab;
				nextPutAll: ('otherSide {1}: nil ]' format: { aRelation oppositeSide name });
				cr;
				tab;
				nextPutAll: ('ifNotNil: [ ' format: { aRelation oppositeSide name });
				cr;
				tab;
				tab;
				nextPutAll: ('self attributeAt: #{1} put: anObject.' format: { aRelation name });
				cr;
				tab;
				tab;
				nextPutAll: ('anObject {1}: self ]' format: { aRelation oppositeSide name }) ].

	aRelation isMany ifTrue: [
			aStream
				tab;
				nextPutAll: ('self {1} value: anObject' format: { aRelation name }) ].

	(aRelation oppositeSide isMany and: [ aRelation isOne ]) ifTrue: [
			aStream
				tab;
				nextPutAll: ('self attributeAt: #{1} put: (FMMultivalueLink on: self update: #{2} from: self {1} to: anObject).' format: {
								 aRelation name.
								 aRelation oppositeSide name }) ]
]
