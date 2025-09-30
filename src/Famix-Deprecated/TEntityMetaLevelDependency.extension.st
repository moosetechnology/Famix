Extension { #name : 'TEntityMetaLevelDependency' }

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
