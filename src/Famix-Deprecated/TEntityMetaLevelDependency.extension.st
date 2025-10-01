Extension { #name : 'TEntityMetaLevelDependency' }

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allParentTypes [

	self deprecated: 'Use allContainerTypes instead' transformWith: '`@rcv allParentTypes' -> '`@rcv allContainerTypes'.
	^ self allContainerTypes
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency classSide >> allParentTypesIn: aMetamodel [

	self deprecated: 'Use #allContainerTypesIn: instead' transformWith: '`@rcv allParentTypesIn: `@arg' -> '`@rcv allContainerTypesIn: `@arg'.
	^ self allContainerTypesIn: aMetamodel
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allParents [

	self deprecated: 'Use #allContainers instead' transformWith: '`@rcv allParents' -> '`@rcv allContainers'.
	^ self allContainers
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allWithAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the entities (recursively) matching one of the class scope that are up or down in the containment tree of the metamodel"

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ self query lineage recursively ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allWithAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the entities (recursively) matching one of the class scope that are up or down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ (self query lineage recursively until: rejectBlock) ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allWithScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are up or down in the containment tree of the metamodel on multiple levels."

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ self query lineage recursively ofType: aClassFAMIX
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allWithScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the entities at a given famix class scope that are up or down in the containment tree of the metamodel on multiple levels.
	I stop the recursion when the rejectBlock is true"

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ (self query lineage recursively until: rejectBlock) ofType: aClassFAMIX
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> belongsTo: anEntity [
	self deprecated: 'belongsTo will be removed in the future. Use the explicit setter for the property you''re trying to set instead. Such has #parentScope, #typeContainer, ...'
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> children [

	self deprecated: 'Use #containedEntities instead' transformWith: '`@rcv children' -> '`@rcv containedEntities'.
	^ self containedEntities
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> childrenSelectors [

	self deprecated: 'Use #containedEntitySelectors instead' transformWith: '`@rcv childrenSelectors' -> '`@rcv containedEntitySelectors'.
	^ self containedEntitySelectors
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency classSide >> childrenSelectorsIn: aMetamodel [

	self deprecated: 'Use #containedEntitySelectorsIn: instead' transformWith: '`@rcv childrenSelectorsIn: `@arg' -> '`@rcv containedEntitySelectorsIn: `@arg'.
	^ self containedEntitySelectorsIn: aMetamodel
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> childrenTypes [

	self deprecated: 'Use #containedEntityTypes instead' transformWith: '`@rcv childrenTypes' -> '`@rcv containedEntityTypes'.
	^ self containedEntityTypes
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency classSide >> childrenTypesIn: aMetamodel [

	self deprecated: 'Use #containedEntityTypesIn: instead.' transformWith: '`@rcv childrenTypesIn: `@arg' -> '`@rcv containedEntityTypesIn: `@arg'.
	^ self containedEntityTypesIn: aMetamodel
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> incomingMSEProperties [

	self deprecated: 'Use #incomingFameProperties instead.' transformWith: '`@rcv incomingMSEProperties' -> '`@rcv incomingFameProperties'.
	^ self incomingFameProperties
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> outgoingMSEProperties [
	"finds all properties from entities of 'self class' to other entities"

	self deprecated: 'Use #outgoingFameProperties instead.' transformWith: '`@rcv outgoingMSEProperties' -> '`@rcv outgoingFameProperties'.
	^ self outgoingFameProperties
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> parentSelectors [

	self deprecated: 'Use #containerSelectors instead' transformWith: '`@rcv parentSelectors' -> '`@rcv containerSelectors'.
	^ self containerSelectors
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency classSide >> parentSelectorsIn: aMetamodel [

	self deprecated: 'Use #containerSelectorsIn: instead' transformWith: '`@rcv parentSelectorsIn: `@arg' -> '`@rcv containerSelectorsIn: `@arg'.
	^ self containerSelectorsIn: aMetamodel
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> parentTypes [

	self deprecated: 'Use #containerTypes instead.' transformWith: '`@rcv parentTypes' -> '`@rcv containerTypes'.
	^ self containerTypes
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency classSide >> parentTypesIn: aMetamodel [

	self deprecated: 'Use #containerTypesIn: instead.' transformWith: '`@rcv parentTypesIn: `@arg' -> '`@rcv containerTypesIn: `@arg'.
	^ self containerTypesIn: aMetamodel
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> parents [

	self deprecated: 'Use #containers instead' transformWith: '`@rcv parents' -> '`@rcv containers'.
	^ self containers
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> parentsDo: aBlock [

	self deprecated: 'Use #containersDo: instead' transformWith: '`@rcv parentsDo: `@arg' -> '`@rcv containersDo: `@arg'.
	self containersDo: aBlock
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> rootParents [

	self deprecated: 'Use #rootContainers instead' transformWith: '`@rcv rootParents' -> '`@rcv rootContainers'.
	^ self rootContainers
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> withAllParents [

	self deprecated: 'Use withAllContainers instead.' transformWith: '`@rcv withAllParents' -> '`@rcv withAllContainers'.
	^ self withAllContainers
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> withAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the first encountered entities matching one of the class scope that are up or down in the containment tree of the metamodel"

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ self query lineage ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> withAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the first encountered entities matching one of the class scope that are up or down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ (self query lineage until: rejectBlock) ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> withScope: aClassFAMIX [
	"I am used to return all the first encountered  entities at a given famix class scope that are up or down in the containment tree of the metamodel"

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ self query lineage ofType: aClassFAMIX
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> withScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the first encountered  entities at a given famix class scope that are up or down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	self deprecated: 'This query taking parents and children has been deprecated. You should use a scope up or a scope down instead.'.
	^ (self query lineage until: rejectBlock) ofType: aClassFAMIX
]
