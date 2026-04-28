Class {
	#name : 'FmxMBRelationSideGenerationStrategy',
	#superclass : 'Object',
	#instVars : [
		'relationSide'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'instance creation' }
FmxMBRelationSideGenerationStrategy class >> for: aRelationSide [

	^ self new relationSide: aRelationSide
]

{ #category : 'generation' }
FmxMBRelationSideGenerationStrategy >> generateGetterCoreOn: aStream for: aRelationSide [

	^ self subclassResponsibility
]

{ #category : 'generation' }
FmxMBRelationSideGenerationStrategy >> generateGetterIn: aFmxBehavioral for: aRelationSide [

	| methodSource commentDefinition |
	commentDefinition := aRelationSide comment ifNotEmpty: [ :comment | '<FMComment: {1}>' format: { comment printString } ].

	methodSource := String streamContents: [ :s |
			                s
				                nextPutAll: aRelationSide name;
				                cr.
			                aRelationSide hasRelation ifTrue: [
					                s
						                tab;
						                nextPutAll: '"Relation named: #';
						                nextPutAll: relationSide name;
						                nextPutAll: ' type: #';
						                nextPutAll: relationSide oppositeType;
						                nextPutAll: ' opposite: #';
						                nextPutAll: relationSide oppositeName;
						                nextPutAll: '"';
						                cr;
						                cr ].
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

	aFmxBehavioral addMethod: methodSource protocol: self protocol
]

{ #category : 'generation' }
FmxMBRelationSideGenerationStrategy >> generateSetterCoreOn: aStream for: aRelationSide [

	^ self subclassResponsibility
]

{ #category : 'generation' }
FmxMBRelationSideGenerationStrategy >> generateSetterIn: aFmxBehavioral for: aRelationSide [

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

	aFmxBehavioral addMethod: methodSource protocol: self protocol
]

{ #category : 'accessing' }
FmxMBRelationSideGenerationStrategy >> protocol [ 
	
	^ #accessing
]

{ #category : 'accessing' }
FmxMBRelationSideGenerationStrategy >> relationSide [

	^ relationSide
]

{ #category : 'accessing' }
FmxMBRelationSideGenerationStrategy >> relationSide: anObject [

	relationSide := anObject
]
