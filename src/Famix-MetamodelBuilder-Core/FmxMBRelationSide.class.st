"
Represents a property referencing another entity
"
Class {
	#name : #FmxMBRelationSide,
	#superclass : #FmxMBProperty,
	#traits : 'FmxMBRelationSideTrait',
	#classTraits : 'FmxMBRelationSideTrait classTrait',
	#instVars : [
		'cardinality',
		'trait',
		'container',
		'relation',
		'relatedClass',
		'derived',
		'source',
		'target',
		'generationStrategy',
		'dependencySource',
		'dependencyTarget'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visitor }
FmxMBRelationSide >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitRelationSide: self.
]

{ #category : #converting }
FmxMBRelationSide >> asRelationSideNamed: aPropertyName [

	"ignore the proposed name"
	^ self 
]

{ #category : #generating }
FmxMBRelationSide >> asSlot [
	self hasRelation ifFalse: [ FmxMBIncompletePropertyDefiniton signal ].

	^ self builder environment
		slotNamed: self name asSymbol
		cardinality: self cardinality
		type: self oppositeType
		opposite: self oppositeName
]

{ #category : #properties }
FmxMBRelationSide >> beDependencyTarget [
	dependencyTarget := true.
]

{ #category : #accessing }
FmxMBRelationSide >> cardinality [
	^ cardinality
]

{ #category : #accessing }
FmxMBRelationSide >> cardinality: anObject [
	cardinality := anObject
]

{ #category : #properties }
FmxMBRelationSide >> container [
	
	self withNavigationOf: self relation.
	container := true
]

{ #category : #accessing }
FmxMBRelationSide >> container: anObject [
	container := anObject
]

{ #category : #properties }
FmxMBRelationSide >> dependencySource [
	self dependencySource: true.
]

{ #category : #properties }
FmxMBRelationSide >> dependencySource: aBoolean [
	dependencySource := aBoolean
]

{ #category : #properties }
FmxMBRelationSide >> derived [
	derived := true
]

{ #category : #properties }
FmxMBRelationSide >> derived: anObject [
	derived := anObject
]

{ #category : #accessing }
FmxMBRelationSide >> from [

	^ self relation from
]

{ #category : #generating }
FmxMBRelationSide >> generateGetterIn: aClassOrTrait [

	^ generationStrategy generateGetterIn: aClassOrTrait for: self
]

{ #category : #generating }
FmxMBRelationSide >> generateSetterIn: aClassOrTrait [

	self generationStrategy generateSetterIn: aClassOrTrait for: self

	
]

{ #category : #accessing }
FmxMBRelationSide >> generationStrategy [
	^ generationStrategy
]

{ #category : #accessing }
FmxMBRelationSide >> generationStrategy: anObject [
	generationStrategy := anObject
]

{ #category : #testing }
FmxMBRelationSide >> hasRelation [
	^ self relation isNotNil
]

{ #category : #initialization }
FmxMBRelationSide >> initialize [
	super initialize.

	cardinality := #one.
	container := false.
	derived := false.
	target := false.
	source := false.
	dependencySource := false.
	dependencyTarget := false.

	self makeStandard
]

{ #category : #properties }
FmxMBRelationSide >> isContainer [

	^ container
]

{ #category : #properties }
FmxMBRelationSide >> isDependencySource [
	^ dependencySource
]

{ #category : #properties }
FmxMBRelationSide >> isDependencyTarget [

	^ dependencyTarget
]

{ #category : #properties }
FmxMBRelationSide >> isDerived [

	^ derived
]

{ #category : #testing }
FmxMBRelationSide >> isMany [

	^ self cardinality = #many
]

{ #category : #testing }
FmxMBRelationSide >> isOne [

	^ self cardinality = #one
]

{ #category : #testing }
FmxMBRelationSide >> isRemote [

	^ self relatedClass isRemote
]

{ #category : #properties }
FmxMBRelationSide >> isSource [

	^ source
]

{ #category : #properties }
FmxMBRelationSide >> isTarget [

	^ target
]

{ #category : #converting }
FmxMBRelationSide >> makeNonremote [

	self generationStrategy: (FmxMBNonRemoteRelationSideGenerationStrategy for: self)
]

{ #category : #converting }
FmxMBRelationSide >> makeRemote [

	self generationStrategy: (FmxMBRemoteRelationSideGenerationStrategy for: self).
	self isRemote: true.
]

{ #category : #converting }
FmxMBRelationSide >> makeStandard [

	self generationStrategy: (FmxMBStandardRelationSideGenerationStrategy for: self)
]

{ #category : #accessing }
FmxMBRelationSide >> many [

	cardinality := #many
]

{ #category : #'relations - named' }
FmxMBRelationSide >> manyToOne: aRelationSide [

	| aRelation ownSide oppositeSide  |
	
	ownSide := self asRelationSideNamed: aRelationSide singularPropertyName.
	oppositeSide := aRelationSide asRelationSideNamed: self pluralPropertyName.
	oppositeSide many.
	oppositeSide derived.
	self flag: 'From here to the end it''s the same in #oneToOne: , #oneToMany: , #manyToOne: , #manyToMany:'.
	ownSide isDependencySource ifTrue: [ oppositeSide beDependencyTarget ].
	oppositeSide isDependencySource ifTrue: [ ownSide beDependencyTarget ].
	aRelation := self relationFrom: ownSide to: oppositeSide.
	self builder configuration navigationForNonContainers
		ifTrue: [ aRelation withNavigation ].

	self isRemote ifTrue: [ ownSide makeRemote ].
	aRelationSide isRemote ifTrue: [ oppositeSide makeRemote ].
	(self isRemote and: [ aRelationSide isRemote not ]) ifTrue: [ oppositeSide makeNonremote ].
	(self isRemote not and: [ aRelationSide isRemote ]) ifTrue: [ ownSide makeNonremote ].
		
	^ aRelation
	
	
]

{ #category : #properties }
FmxMBRelationSide >> noContainer [
	
	container := false
]

{ #category : #properties }
FmxMBRelationSide >> notDerived [
	
	derived := false
]

{ #category : #accessing }
FmxMBRelationSide >> one [

	cardinality := #one
]

{ #category : #accessing }
FmxMBRelationSide >> oppositeName [
	^ self otherSide name asSymbol
]

{ #category : #accessing }
FmxMBRelationSide >> oppositeType [
	^ (self otherSide builder configuration prefix , self otherSide relatedEntityName) asSymbol
]

{ #category : #accessing }
FmxMBRelationSide >> otherSide [
	| aFromSide |
	aFromSide := self relation from.
	^ aFromSide == self
		ifTrue: [ self relation to ]
		ifFalse: [ aFromSide ]
]

{ #category : #private }
FmxMBRelationSide >> pluralPropertyName [

	^ self propertyName
]

{ #category : #printing }
FmxMBRelationSide >> producesSlot [

	^ self generationStrategy producesSlot
]

{ #category : #private }
FmxMBRelationSide >> propertyName [

	^ self relatedClass propertyName
]

{ #category : #accessing }
FmxMBRelationSide >> relatedClass [
	^ relatedClass
]

{ #category : #accessing }
FmxMBRelationSide >> relatedClass: anObject [
	relatedClass := anObject
]

{ #category : #accessing }
FmxMBRelationSide >> relatedEntity [

	^ trait ifNil: [ relatedClass ]
]

{ #category : #accessing }
FmxMBRelationSide >> relatedEntityName [

	^ self relatedEntity name
]

{ #category : #accessing }
FmxMBRelationSide >> relation [
	^ relation
]

{ #category : #accessing }
FmxMBRelationSide >> relation: anObject [
	relation := anObject
]

{ #category : #accessing }
FmxMBRelationSide >> remoteBuilderDo: aBlock [

	self relatedEntity additionalProperties at: #remoteBuilder ifPresent: aBlock
]

{ #category : #'name conversion' }
FmxMBRelationSide >> singularPropertyName [

	| normalizedName uncapitalized aName |
	
	aName := self propertyName.
	
	normalizedName := ((aName size >= 2) 
		and: [ ((aName first:2) allSatisfy: #isUppercase)
		and: [ aName beginsWith: 'T' ] ])
			ifTrue: [ aName withoutPrefix: 'T' ]
			ifFalse: [ aName ].	
	
	uncapitalized := normalizedName uncapitalized.
	
	^ uncapitalized

]

{ #category : #properties }
FmxMBRelationSide >> source [

	source := true.
]

{ #category : #properties }
FmxMBRelationSide >> source: aBoolean [
	source := aBoolean
]

{ #category : #properties }
FmxMBRelationSide >> target [

	target := true.
]

{ #category : #properties }
FmxMBRelationSide >> target: anObject [
	target := anObject
]

{ #category : #accessing }
FmxMBRelationSide >> to [

	^ self relation to
]

{ #category : #accessing }
FmxMBRelationSide >> trait [
	^ trait
]

{ #category : #accessing }
FmxMBRelationSide >> trait: anObject [
	self relatedEntity ifNotNil: [ :aRelatedEntity | aRelatedEntity removeRelationSide: self ].
	trait := anObject.
	trait addRelationSide: self
]
