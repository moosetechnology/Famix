"
I'm a visitor for instances of #FamixMetamodelGenerator and subclasses.

I just visit each node in the builder, and print it on the Transcript.

see FmxMBVisitor to see how to use me.


"
Class {
	#name : #FmxMBPrintVisitor,
	#superclass : #FmxMBWalkerVisitor,
	#category : #'Famix-MetamodelBuilder-Core-Visitors'
}

{ #category : #'as yet unclassified' }
FmxMBPrintVisitor >> prepareForPropertiesIn: aClassOrTrait [

	(aClassOrTrait properties isNotEmpty or: [
		 aClassOrTrait relations isNotEmpty ]) ifFalse: [ ^ self ].

	Transcript
		cr;
		tab;
		tab
]

{ #category : #visiting }
FmxMBPrintVisitor >> separateProperties [

	Transcript
		cr;
		tab;
		tab
]

{ #category : #visiting }
FmxMBPrintVisitor >> visitBuilder: aBuilder [

	self trace: aBuilder generator class.
	super visitBuilder: aBuilder
]

{ #category : #visiting }
FmxMBPrintVisitor >> visitClass: aClass [

	self traceCrTab: ''.
	aClass name trace.
	self trace: ' -|> '.
	(aClass classGeneralization
		 ifNil: [ 'Entity' ]
		 ifNotNil: [ :generalization | generalization name ]) trace.
	aClass traitGeneralizations ifNotEmpty: [ :generalizations |
		generalizations
			do: [ :generalization | generalization name trace ]
			separatedBy: [ ', ' trace ] ].

	super visitClass: aClass
]

{ #category : #visiting }
FmxMBPrintVisitor >> visitRelationSide: aRelationSide [

	self trace:
		aRelationSide name , ' (' , aRelationSide oppositeType , ')'
]

{ #category : #visiting }
FmxMBPrintVisitor >> visitTrait: aTrait [

	self traceCrTab: ''.
	aTrait name trace.

	aTrait traitGeneralizations ifNotEmpty: [ :generalizations |
		self trace: ' -|> '.
		generalizations
			do: [ :generalization | generalization name trace ]
			separatedBy: [ ', ' trace ] ].

	super visitTrait: aTrait
]

{ #category : #visiting }
FmxMBPrintVisitor >> visitTypedProperty: aTypedProperty [

	self trace:
		aTypedProperty name , ' (' , aTypedProperty propertyType , ')'
]
