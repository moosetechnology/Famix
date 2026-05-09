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
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'accessing' }
FmxMBRelationAccessorsGenerationStrategy class >> defaultInstance [
	"Keeping a default instance since I have no state"

	^ defaultInstance ifNil: [ defaultInstance := self new ]
]

{ #category : 'generation' }
FmxMBRelationAccessorsGenerationStrategy >> generateGetterCodeFor: aRelationSide [

	| commentDefinition |
	commentDefinition := aRelationSide comment ifNotEmpty: [ :comment | '<FMComment: {1}>' format: { comment printString } ].

	^ String streamContents: [ :s |
			  s
				  nextPutAll: aRelationSide name;
				  cr;
				  tab;
				  nextPutAll: '"Relation named: #';
				  nextPutAll: aRelationSide name;
				  nextPutAll: ' type: #';
				  nextPutAll: aRelationSide oppositeType;
				  nextPutAll: ' opposite: #';
				  nextPutAll: aRelationSide oppositeName;
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
			  aRelationSide isContainer ifTrue: [
					  s
						  tab;
						  nextPutAll: '<container>';
						  cr ].
			  aRelationSide isDerived ifTrue: [
					  s
						  tab;
						  nextPutAll: '<derived>';
						  cr ].
			  aRelationSide isSource ifTrue: [
					  s
						  tab;
						  nextPutAll: '<source>';
						  cr ].
			  aRelationSide isTarget ifTrue: [
					  s
						  tab;
						  nextPutAll: '<target>';
						  cr ].

			  self generateGetterCoreOn: s for: aRelationSide ]
]

{ #category : 'generation' }
FmxMBRelationAccessorsGenerationStrategy >> generateGetterCoreOn: aStream for: aRelationSide [

	^ self subclassResponsibility
]

{ #category : 'generation' }
FmxMBRelationAccessorsGenerationStrategy >> generateGetterIn: aFmxBehavioral for: aRelationSide [

	| methodSource commentDefinition |
	commentDefinition := aRelationSide comment ifNotEmpty: [ :comment | '<FMComment: {1}>' format: { comment printString } ].

	methodSource := String streamContents: [ :s |
			                s
				                nextPutAll: aRelationSide name;
				                cr;
				                tab;
				                nextPutAll: '"Relation named: #';
				                nextPutAll: aRelationSide name;
				                nextPutAll: ' type: #';
				                nextPutAll: aRelationSide oppositeType;
				                nextPutAll: ' opposite: #';
				                nextPutAll: aRelationSide oppositeName;
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
			                aRelationSide isContainer ifTrue: [
					                s
						                tab;
						                nextPutAll: '<container>';
						                cr ].
			                aRelationSide isDerived ifTrue: [
					                s
						                tab;
						                nextPutAll: '<derived>';
						                cr ].
			                aRelationSide isSource ifTrue: [
					                s
						                tab;
						                nextPutAll: '<source>';
						                cr ].
			                aRelationSide isTarget ifTrue: [
					                s
						                tab;
						                nextPutAll: '<target>';
						                cr ].

			                self generateGetterCoreOn: s for: aRelationSide ].

	aFmxBehavioral addMethod: methodSource protocol: (self protocolFor: aRelationSide)
]

{ #category : 'generation' }
FmxMBRelationAccessorsGenerationStrategy >> generateSetterCodeFor: aRelationSide [

	^ String streamContents: [ :s |
			  s
				  nextPutAll: aRelationSide name;
				  nextPutAll: ': anObject';
				  cr;
				  cr.
			  s
				  tab;
				  nextPutAll: '<generated>';
				  cr.
			  self generateSetterCoreOn: s for: aRelationSide ]
]

{ #category : 'generation' }
FmxMBRelationAccessorsGenerationStrategy >> generateSetterCoreOn: aStream for: aRelationSide [

	^ self subclassResponsibility
]

{ #category : 'generation' }
FmxMBRelationAccessorsGenerationStrategy >> generateSetterIn: aFmxBehavioral for: aRelationSide [

	| methodSource |
	methodSource := String streamContents: [ :s |
			                s
				                nextPutAll: aRelationSide name;
				                nextPutAll: ': anObject';
				                cr;
				                cr.
			                s
				                tab;
				                nextPutAll: '<generated>';
				                cr.
			                self generateSetterCoreOn: s for: aRelationSide ].

	aFmxBehavioral addMethod: methodSource protocol: (self protocolFor: aRelationSide)
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
