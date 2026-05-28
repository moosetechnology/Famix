Trait {
	#name : 'FmxMBRelationSideTrait',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> *- relationOrBehavior [

	^ self manyToOne: relationOrBehavior
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> *-* relationOrBehavior [

	^ self manyToMany: relationOrBehavior
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> *-<> relationOrBehavior [

	^ self manyBelongTo: relationOrBehavior
	
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> - relationOrBehavior [

	^ self oneToOne: relationOrBehavior
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> -* relationOrBehavior [

	^ self oneToMany: relationOrBehavior
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> -<> relationOrBehavior [

	^ self oneBelongsTo: relationOrBehavior

	
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> <>- relationOrBehavior [

	^ self containsOne: relationOrBehavior
	
]

{ #category : 'relations - arrows' }
FmxMBRelationSideTrait >> <>-* relationOrBehavior [

	^ self containsMany: relationOrBehavior
	

	
]

{ #category : 'relations - named' }
FmxMBRelationSideTrait >> asRelationNamed: aPropertyName [

	<ignoreForCoverage>
	self explicitRequirement
	
]

{ #category : 'relations - named containers' }
FmxMBRelationSideTrait >> containsMany: relationOrBehavior [

	| aRelation |
	aRelation := self oneToMany: relationOrBehavior.
	aRelation oppositeSide container.
	^ aRelation
]

{ #category : 'relations - named containers' }
FmxMBRelationSideTrait >> containsOne: relationOrBehavior [

	| aRelation |
	aRelation := self oneToOne: relationOrBehavior.
	aRelation oppositeSide container.
	^ aRelation
]

{ #category : 'relations - named containers' }
FmxMBRelationSideTrait >> manyBelongTo: relationOrBehavior [

	^ (self manyToOne: relationOrBehavior)
		  container;
		  yourself
]

{ #category : 'relations - named' }
FmxMBRelationSideTrait >> manyToMany: relationOrBehavior [

	| ownSide oppositeSide |
	ownSide := self asRelationNamed: relationOrBehavior pluralPropertyName.
	oppositeSide := relationOrBehavior asRelationNamed: self pluralPropertyName.
	ownSide many.
	ownSide derived.
	oppositeSide many.
	ownSide oppositeSide: oppositeSide.

	self isRemote ifTrue: [ ownSide makeRemote ].
	relationOrBehavior isRemote ifTrue: [ oppositeSide makeRemote ].

	^ ownSide
]

{ #category : 'relations - named' }
FmxMBRelationSideTrait >> manyToOne: relationOrBehavior [

	| ownSide oppositeSide |
	ownSide := self asRelationNamed: relationOrBehavior singularPropertyName.
	oppositeSide := relationOrBehavior asRelationNamed: self pluralPropertyName.
	oppositeSide many.
	oppositeSide derived.
	ownSide oppositeSide: oppositeSide.

	self isRemote ifTrue: [ ownSide makeRemote ].
	relationOrBehavior isRemote ifTrue: [ oppositeSide makeRemote ].

	^ ownSide
]

{ #category : 'relations - named containers' }
FmxMBRelationSideTrait >> oneBelongsTo: relationOrBehavior [

	^ (self oneToOne: relationOrBehavior)
		  container;
		  yourself
]

{ #category : 'relations - named' }
FmxMBRelationSideTrait >> oneToMany: relationOrBehavior [

	| ownSide oppositeSide |
	ownSide := self asRelationNamed: relationOrBehavior pluralPropertyName.
	oppositeSide := relationOrBehavior asRelationNamed: self singularPropertyName.
	ownSide many.
	ownSide derived.
	ownSide oppositeSide: oppositeSide.

	self isRemote ifTrue: [ ownSide makeRemote ].
	relationOrBehavior isRemote ifTrue: [ oppositeSide makeRemote ].

	^ ownSide
]

{ #category : 'relations - named' }
FmxMBRelationSideTrait >> oneToOne: relationOrBehavior [

	| ownSide oppositeSide |
	ownSide := self asRelationNamed: relationOrBehavior propertyName.
	oppositeSide := relationOrBehavior asRelationNamed: self propertyName.
	oppositeSide derived.
	ownSide oppositeSide: oppositeSide.

	self isRemote ifTrue: [ ownSide makeRemote ].
	relationOrBehavior isRemote ifTrue: [ oppositeSide makeRemote ].

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
