Class {
	#name : 'FmxMBTrait',
	#superclass : 'FmxMBBehavior',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visitor' }
FmxMBTrait >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitTrait: self.
]

{ #category : 'accessing' }
FmxMBTrait >> allTraitGeneralizations [

	^ (self traitGeneralizations flatCollect: [ :each |
		   { each } , each allTraitGeneralizations ]) removeDuplicates
]

{ #category : 'accessing' }
FmxMBTrait >> classGeneralization [

	^ self builder environment basicTrait
]

{ #category : 'accessing' }
FmxMBTrait >> classGeneralization: anObject [
	FmxMBTraitsGeneralizationError signal
]

{ #category : 'accessing' }
FmxMBTrait >> defaultSuperclass [
	
	^ self builder environment basicTrait
]

{ #category : 'accessing' }
FmxMBTrait >> defaultSuperclassName [
	"In case of Traits we want the annotation to point Object as superclass."

	^ 'Object'
]

{ #category : 'settings-default' }
FmxMBTrait >> defaultTag [

	^ #Traits
]

{ #category : 'generating' }
FmxMBTrait >> generate [

	self builder environment
		createTraitNamed: self fullName
		traitDefinitions: self allTraitDefinitions
		precedingTrait: (self additionalProperties at: #precedingTrait ifAbsent: [ nil ])
		properties: (self properties select: #producesSlot)
		in: self packageName
		tag: self tag
		comment: self commentWithRelations.

	self generateAccessors.
	self generateAnnotation.

	self generateTestingMethods.

	self generateAddToCollection
]

{ #category : 'generating' }
FmxMBTrait >> generateRemotes [

	| aTrait |
	aTrait := self class environment at: self fullName ifAbsent: [ ^ self ].

	(self properties select: [ :prop | prop isRemote and: [ (aTrait localSelectors includes: prop name) not ] ]) do: [ :each | each generateAccessorsIn: self ]
]

{ #category : 'testing' }
FmxMBTrait >> isMetamodelTrait [

	^ true
]

{ #category : 'testing' }
FmxMBTrait >> isVisitorTrait [

	^ false
]

{ #category : 'name conversion' }
FmxMBTrait >> pluralPropertyName [
	^ self pluralOf: self propertyName
]

{ #category : 'name conversion' }
FmxMBTrait >> propertyName [
	^ (self name withoutPrefix: 'T') uncapitalized
]

{ #category : 'accessing' }
FmxMBTrait >> removeRelationSide: aRelationSide [

	properties remove: aRelationSide ifAbsent: [ ].
]
