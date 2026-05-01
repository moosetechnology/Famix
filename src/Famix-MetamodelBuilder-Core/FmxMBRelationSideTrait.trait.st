Trait {
	#name : 'FmxMBRelationSideTrait',
	#category : 'Famix-MetamodelBuilder-Core-Traits',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Traits'
}

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> *- aRelationSide [

	^ self manyToOne: aRelationSide
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> *-* aRelationSide [

	^ self manyToMany: aRelationSide
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> *-<> aRelationSide [

	^ self manyBelongTo: aRelationSide
	
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> - aRelationSide [

	^ self oneToOne: aRelationSide
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> -* aRelationSide [

	^ self oneToMany: aRelationSide
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> -<> aRelationSide [

	^ self oneBelongsTo: aRelationSide

	
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> <>- aRelationSide [

	^ self containsOne: aRelationSide
	
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> <>-* aRelationSide [

	^ self containsMany: aRelationSide
	

	
]

{ #category : 'relations - named' }
FmxMBRelationSideTrait >> asRelationSideNamed: aPropertyName [

	<ignoreForCoverage>
	self explicitRequirement
	
]

{ #category : 'relations - named containers' }
FmxMBRelationSideTrait >> containsMany: aRelationSide [

	| aRelation |
	aRelation := self oneToMany: aRelationSide.
	aRelation oppositeSide container.
	^ aRelation
]

{ #category : 'relations - named containers' }
FmxMBRelationSideTrait >> containsOne: aRelationSide [

	| aRelation |
	aRelation := self oneToOne: aRelationSide.
	aRelation oppositeSide container.
	^ aRelation
]

{ #category : 'relations - named containers' }
FmxMBRelationSideTrait >> manyBelongTo: aRelationSide [

	^ (self manyToOne: aRelationSide)
		  container;
		  yourself
]

{ #category : 'relations - named' }
FmxMBRelationSideTrait >> manyToMany: aRelationSide [

	| ownSide oppositeSide |
	ownSide := self asRelationSideNamed: aRelationSide pluralPropertyName.
	oppositeSide := aRelationSide asRelationSideNamed: self pluralPropertyName.
	ownSide many.
	ownSide derived.
	oppositeSide many.
	ownSide oppositeSide: oppositeSide.

	self isRemote ifTrue: [ ownSide makeRemote ].
	aRelationSide isRemote ifTrue: [ oppositeSide makeRemote ].

	^ ownSide
]

{ #category : 'relations - named' }
FmxMBRelationSideTrait >> manyToOne: aRelationSide [

	| ownSide oppositeSide |
	ownSide := self asRelationSideNamed: aRelationSide singularPropertyName.
	oppositeSide := aRelationSide asRelationSideNamed: self pluralPropertyName.
	oppositeSide many.
	oppositeSide derived.
	ownSide oppositeSide: oppositeSide.

	self isRemote ifTrue: [ ownSide makeRemote ].
	aRelationSide isRemote ifTrue: [ oppositeSide makeRemote ].

	^ ownSide
]

{ #category : 'relations - named containers' }
FmxMBRelationSideTrait >> oneBelongsTo: aRelationSide [

	^ (self oneToOne: aRelationSide)
		  container;
		  yourself
]

{ #category : 'relations - named' }
FmxMBRelationSideTrait >> oneToMany: aRelationSide [

	| ownSide oppositeSide |
	ownSide := self asRelationSideNamed: aRelationSide pluralPropertyName.
	oppositeSide := aRelationSide asRelationSideNamed: self singularPropertyName.
	ownSide many.
	ownSide derived.
	ownSide oppositeSide: oppositeSide.

	self isRemote ifTrue: [ ownSide makeRemote ].
	aRelationSide isRemote ifTrue: [ oppositeSide makeRemote ].

	^ ownSide
]

{ #category : 'relations - named' }
FmxMBRelationSideTrait >> oneToOne: aRelationSide [

	| ownSide oppositeSide |
	ownSide := self asRelationSideNamed: aRelationSide propertyName.
	oppositeSide := aRelationSide asRelationSideNamed: self propertyName.
	oppositeSide derived.
	ownSide oppositeSide: oppositeSide.

	self isRemote ifTrue: [ ownSide makeRemote ].
	aRelationSide isRemote ifTrue: [ oppositeSide makeRemote ].

	^ ownSide
]

{ #category : 'private' }
FmxMBRelationSideTrait >> pluralPropertyName [

	self explicitRequirement
]

{ #category : 'private' }
FmxMBRelationSideTrait >> propertyName [

	^ self explicitRequirement
]
