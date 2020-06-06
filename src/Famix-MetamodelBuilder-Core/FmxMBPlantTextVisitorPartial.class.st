"
a FmxMBPlantTextVisitor that output only a part of the metamodel visited 

It has a list of classeNames to output with their relationships.
Other classes/relationships will be ignored, including relationships between ""wanted"" and ""unwanted"" classes
"
Class {
	#name : #FmxMBPlantTextVisitorPartial,
	#superclass : #FmxMBPlantTextVisitor,
	#instVars : [
		'classeNames'
	],
	#category : #'Famix-MetamodelBuilder-Core-Visitors'
}

{ #category : #accessing }
FmxMBPlantTextVisitorPartial >> classeNames [
	^classeNames
]

{ #category : #accessing }
FmxMBPlantTextVisitorPartial >> classeNames: aCollection [
	classeNames := aCollection 
]

{ #category : #testing }
FmxMBPlantTextVisitorPartial >> isWantedClass: aClass [
	^self classeNames anySatisfy: [ :c | c asSymbol = aClass name ]
]

{ #category : #testing }
FmxMBPlantTextVisitorPartial >> isWantedRelation: aRelationSide [
	^aRelationSide relation sides allSatisfy: [ :side |
		side relatedClass notNil and: 
		[ self isWantedClass: side relatedClass ]
	]

]

{ #category : #visiting }
FmxMBPlantTextVisitorPartial >> visitClass: aClass [
	(self isWantedClass: aClass) ifFalse: [ ^ self ].
	super visitClass: aClass
]

{ #category : #visiting }
FmxMBPlantTextVisitorPartial >> visitRelationSide: aRelationSide [
	(self isWantedRelation: aRelationSide)
	ifFalse: [ ^ self ].
	super  visitRelationSide: aRelationSide

]
