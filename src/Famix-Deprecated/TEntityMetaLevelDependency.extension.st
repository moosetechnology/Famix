Extension { #name : 'TEntityMetaLevelDependency' }

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allAtAnyScope: aCollectionOfFamixClasses [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv allAtAnyScope: `@arg1' -> '`@rcv query containers recursively ofAnyType: `@arg1'.
	^ self query containers recursively ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allAtAnyScope: aCollectionOfFamixClasses until: rejectBlock [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv allAtAnyScope: `@arg1 until: `@arg2' -> '(`@rcv query containers recursively until: `@arg2) ofAnyType: `@arg1'.
	^ (self query containers recursively until: rejectBlock) ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allAtScope: aType [

	self deprecated: 'Use #allContainersOfType: instead' transformWith: '`@rcv allAtScope: `@arg' -> '`@rcv allContainersOfType: `@arg'.
	^ self allContainersOfType: aType
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allAtScope: aClassFAMIX until: rejectBlock [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv allAtScope: `@arg1 until: `@arg2' -> '(`@rcv query containers recursively until: `@arg2) ofType: `@arg1'.

	^ (self query containers recursively until: rejectBlock) ofType: aClassFAMIX
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allChildren [

	self deprecated: 'Use #allContainedEntities instead' transformWith: '`@rcv allChildren' -> '`@rcv allContainedEntities'.
	^ self allContainedEntities
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allChildrenTypes [

	self deprecated: 'Use #allContainedEntityTypes instead' transformWith: '`@rcv allChildrenTypes' -> '`@rcv allContainedEntityTypes'.
	^ self allContainedEntityTypes
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency classSide >> allChildrenTypesIn: aMetamodel [

	self deprecated: 'Use #allContainedEntityTypesIn: instead' transformWith: '`@rcv allChildrenTypesIn: `@arg' -> '`@rcv allContainedEntityTypesIn: `@arg'.
	^ self allContainedEntityTypesIn: aMetamodel
]

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
TEntityMetaLevelDependency >> allToAnyScope: aCollectionOfFamixClasses [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv allToAnyScope: `@arg1' -> '`@rcv query containedEntities recursively ofAnyType: `@arg1'.
	^ self query containedEntities recursively ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allToAnyScope: aCollectionOfFamixClasses until: rejectBlock [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv allToAnyScope: `@arg1 until: `@arg2' -> '(`@rcv query containedEntities recursively until: `@arg2) ofAnyType: `@arg1'.
	^ (self query containedEntities recursively until: rejectBlock) ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allToScope: aType [

	self deprecated: 'Use #allContainedEntitiesOfType: instead' transformWith: '`@rcv allToScope: `@arg' -> '`@rcv allContainedEntitiesOfType: `@arg'.
	^ self allContainedEntitiesOfType: aType
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> allToScope: aClassFAMIX until: rejectBlock [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv allToScope: `@arg1 until: `@arg2' -> '(`@rcv query containedEntities recursively until: `@arg2) ofType: `@arg1'.

	^ (self query containedEntities recursively until: rejectBlock) ofType: aClassFAMIX
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
TEntityMetaLevelDependency >> atAnyScope: aCollectionOfFamixClasses [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv atAnyScope: `@arg1' -> '`@rcv query containers ofAnyType: `@arg1'.

	^ self query containers ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> atAnyScope: aCollectionOfFamixClasses until: rejectBlock [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv atAnyScope: `@arg1 until: `@arg2' -> '(`@rcv query containers until: `@arg2) ofAnyType: `@arg1'.
	^ (self query containers until: rejectBlock) ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> atScope: aType [
	"I am used to return all the first encountered entities at a given famix class scope that are up in the containment tree of the metamodel"

	self deprecated: 'Use #containersOfType: instead' transformWith: '`@rcv atScope: `@arg' -> '`@rcv containersOfType: `@arg'.
	^ self containersOfType: aType
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> atScope: aClassFAMIX until: rejectBlock [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv atScope: `@arg1 until: `@arg2' -> '(`@rcv query containers until: `@arg2) ofType: `@arg1'.

	^ (self query containers until: rejectBlock) ofType: aClassFAMIX
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> atScopeWithProperty: aPropertySelector [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv atScopeWithProperty: `@arg1' -> '`@rcv query containers withProperty: `@arg1'.
	^ self query containers withProperty: aPropertySelector
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
TEntityMetaLevelDependency >> numberOfChildren [

	self deprecated: 'Use #numberOfContainedEntities instead' transformWith: '`@rcv numberOfChildren' -> '`@rcv numberOfContainedEntities'.
	^ self numberOfContainedEntities
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
TEntityMetaLevelDependency >> queryAllIncomingInvocations [

	self
		deprecated: 'This method should be replaced by a usage of #queryIncoming:'
		transformWith: '`@rcv queryAllIncomingInvocations' -> '`@rcv queryIncoming: FamixTInvocation'.
	^ self queryIncoming: FamixTInvocation
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> queryAllOutgoingInvocations [

	self
		deprecated: 'This method should be replaced by a usage of #queryOutgoing:'
		transformWith: '`@rcv queryAllOutgoingInvocations' -> '`@rcv queryOutgoing: FamixTInvocation'.
	^ self queryOutgoing: FamixTInvocation
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> queryIncomingAccesses [

	self
		deprecated: 'This method should be replaced by a usage of #queryIncoming:'
		transformWith: '`@rcv queryIncomingAccesses' -> '`@rcv queryIncoming: FamixTAccess'.
	^ self queryIncoming: FamixTAccess
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> queryIncomingInheritances [

	self
		deprecated: 'This method should be replaced by a usage of #queryIncoming:'
		transformWith: '`@rcv queryIncomingInheritances' -> '`@rcv queryIncoming: FamixTInheritance'.
	^ self queryIncoming: FamixTInheritance
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> queryIncomingReferences [

	self
		deprecated: 'This method should be replaced by a usage of #queryIncoming:'
		transformWith: '`@rcv queryIncomingReferences' -> '`@rcv queryIncoming: FamixTReference'.
	^ self queryIncoming: FamixTReference
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> queryOutgoingAccesses [

	self
		deprecated: 'This method should be replaced by a usage of #queryOutgoing:'
		transformWith: '`@rcv queryOutgoingAccesses' -> '`@rcv queryOutgoing: FamixTAccess'.
	^ self queryOutgoing: FamixTAccess
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> queryOutgoingInheritances [

	self
		deprecated: 'This method should be replaced by a usage of #queryOutgoing:'
		transformWith: '`@rcv queryOutgoingInheritances' -> '`@rcv queryOutgoing: FamixTInheritance'.
	^ self queryOutgoing: FamixTInheritance
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> queryOutgoingReferences [

	self
		deprecated: 'This method should be replaced by a usage of #queryOutgoing:'
		transformWith: '`@rcv queryOutgoingReferences' -> '`@rcv queryOutgoing: FamixTReference'.
	^ self queryOutgoing: FamixTReference
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> rootParents [

	self deprecated: 'Use #rootContainers instead' transformWith: '`@rcv rootParents' -> '`@rcv rootContainers'.
	^ self rootContainers
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> sourceThrough: aType [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv sourceThrough: `@arg' -> '`@rcv query incoming objects dependenciesOfType: `@arg'.

	^ self query incoming objects dependenciesOfType: aType
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> targetThrough: aType [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv targetThrough: `@arg' -> '`@rcv query outgoing objects dependenciesOfType: `@arg'.

	^ self query outgoing objects dependenciesOfType: aType
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> throughAllFrom [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv throughAllFrom' -> '`@rcv query incoming objects dependencies'.

	^ self query incoming objects dependencies
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> throughAllTo [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv throughAllTo' -> '`@rcv query outgoing objects dependencies'.

	^ self query outgoing objects dependencies
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> toAnyScope: aCollectionOfFamixClasses [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv toAnyScope: `@arg1' -> '`@rcv query containedEntities ofAnyType: `@arg1'.
	^ self query containedEntities ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> toAnyScope: aCollectionOfFamixClasses until: rejectBlock [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv toAnyScope: `@arg1 until: `@arg2' -> '(`@rcv query containedEntities until: `@arg2) ofAnyType: `@arg1'.
	^ (self query containedEntities until: rejectBlock) ofAnyType: aCollectionOfFamixClasses
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> toScope: aType [

	self deprecated: 'Use #containedEntitiesOfType: instead' transformWith: '`@rcv toScope: `@arg' -> '`@rcv containedEntitiesOfType: `@arg'.
	^ self containedEntitiesOfType: aType
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> toScope: aClassFAMIX until: rejectBlock [

	self
		deprecated: 'This method will be removed because it is syntactic sugar that is not really used. Let the transformation work the change.'
		transformWith: '`@rcv toScope: `@arg1 until: `@arg2' -> '(`@rcv query containedEntities until: `@arg2) ofType: `@arg1'.

	^ (self query containedEntities until: rejectBlock) ofType: aClassFAMIX
]

{ #category : '*Famix-Deprecated' }
TEntityMetaLevelDependency >> withAllChildren [

	self deprecated: 'Use #withAllContainedEntities instead' transformWith: '`@rcv withAllChildren' -> '`@rcv withAllContainedEntities'.
	^ self withAllContainedEntities
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
