Class {
	#name : 'FmxMBRemoteChangesBuilderVisitor',
	#superclass : 'FmxMBAbstractChangesBuilderVisitor',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visiting' }
FmxMBRemoteChangesBuilderVisitor >> visitClass: aClass [

	currentBehavioral := aClass.
	self class environment at: aClass fullName ifAbsent: [ ^ self ].

	(aClass propertiesAndRelations select: #isRemote) do: [ :each | each acceptVisitor: self ]
]

{ #category : 'visiting' }
FmxMBRemoteChangesBuilderVisitor >> visitTrait: aTrait [

	| realTrait |
	currentBehavioral := aTrait.

	realTrait := self class environment at: aTrait fullName ifAbsent: [ ^ self ].

	(aTrait propertiesAndRelations select: [ :prop | prop isRemote and: [ (realTrait localSelectors includes: prop name) not ] ]) do: [ :each |
		each acceptVisitor: self ]
]
