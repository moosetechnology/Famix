Class {
	#name : 'FmxMBRelationSideGenerationStrategy',
	#superclass : 'Object',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

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

	aFmxBehavioral addMethod: methodSource protocol: (self protocolFor: aRelationSide)
]

{ #category : 'accessing' }
FmxMBRelationSideGenerationStrategy >> protocolFor: aRelation [

	^ #accessing
]
