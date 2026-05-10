"
I am a strategy used during the generation of the Famix code to handle the way to generate accessors for a relation.

I am an abstract class. Check my subclasses for more information
"
Class {
	#name : 'FmxMBRelationAccessorsGenerationStrategy',
	#superclass : 'Object',
	#classInstVars : [
		'defaultInstance'
	],
	#category : 'Famix-MetamodelBuilder-Core-Generation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Generation'
}

{ #category : 'accessing' }
FmxMBRelationAccessorsGenerationStrategy class >> defaultInstance [
	"Keeping a default instance since I have no state"

	^ defaultInstance ifNil: [ defaultInstance := self new ]
]

{ #category : 'generation' }
FmxMBRelationAccessorsGenerationStrategy >> generateGetterCodeFor: aRelation [

	| commentDefinition |
	commentDefinition := aRelation comment ifNotEmpty: [ :comment | '<FMComment: {1}>' format: { comment printString } ].

	^ String streamContents: [ :s |
			  s
				  nextPutAll: aRelation name;
				  cr;
				  tab;
				  nextPutAll: '"Relation named: #';
				  nextPutAll: aRelation name;
				  nextPutAll: ' type: #';
				  nextPutAll: aRelation oppositeType;
				  nextPutAll: ' opposite: #';
				  nextPutAll: aRelation oppositeName;
				  nextPutAll: '"';
				  cr;
				  cr.
			  s
				  tab;
				  nextPutAll: '<generated>';
				  cr.
			  commentDefinition ifNotEmpty: [
					  s
						  tab;
						  nextPutAll: commentDefinition;
						  cr ].
			  aRelation isContainer ifTrue: [
					  s
						  tab;
						  nextPutAll: '<container>';
						  cr ].
			  aRelation isDerived ifTrue: [
					  s
						  tab;
						  nextPutAll: '<derived>';
						  cr ].
			  aRelation isSource ifTrue: [
					  s
						  tab;
						  nextPutAll: '<source>';
						  cr ].
			  aRelation isTarget ifTrue: [
					  s
						  tab;
						  nextPutAll: '<target>';
						  cr ].

			  self generateGetterCoreOn: s for: aRelation ]
]

{ #category : 'generation' }
FmxMBRelationAccessorsGenerationStrategy >> generateGetterCoreOn: aStream for: aRelation [

	^ self subclassResponsibility
]

{ #category : 'generation' }
FmxMBRelationAccessorsGenerationStrategy >> generateSetterCodeFor: aRelation [

	^ String streamContents: [ :s |
			  s
				  nextPutAll: aRelation name;
				  nextPutAll: ': anObject';
				  cr;
				  cr.
			  s
				  tab;
				  nextPutAll: '<generated>';
				  cr.
			  self generateSetterCoreOn: s for: aRelation ]
]

{ #category : 'generation' }
FmxMBRelationAccessorsGenerationStrategy >> generateSetterCoreOn: aStream for: aRelation [

	^ self subclassResponsibility
]

{ #category : 'testing' }
FmxMBRelationAccessorsGenerationStrategy >> producesSlot [

	^ false
]

{ #category : 'accessing' }
FmxMBRelationAccessorsGenerationStrategy >> protocolFor: aRelation [

	^ aRelation isRemote
		  ifTrue: [ '*' , aRelation builder parentBuilderPackageName ]
		  ifFalse: [ #accessing ]
]
