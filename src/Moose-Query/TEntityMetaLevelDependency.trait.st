Trait {
	#name : #TEntityMetaLevelDependency,
	#category : #'Moose-Query-Traits'
}

{ #category : #new }
TEntityMetaLevelDependency classSide >> allChildrenTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allChildrenTypes for: self ifAbsentPut: [ self privateAllChildrenTypesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> allIncomingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allIncomingAssociationTypes for: self ifAbsentPut: [ self privateAllIncomingAssociationTypesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> allOutgoingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allOutgoingAssociationTypes for: self ifAbsentPut: [ self privateAllOutgoingAssociationTypesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> allParentTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allParentTypes for: self ifAbsentPut: [ self privateAllParentTypesIn: aMetamodel ]
	
]

{ #category : #meta }
TEntityMetaLevelDependency classSide >> annotation [

	<FMClass: #TEntityMetaLevelDependency super: #Object>
	<package: #'Moose-Query'>
	<generated>
	^self
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> childrenSelectorsIn: aMetamodel [

	^ aMetamodel additionalProperty: #childrenSelectors for: self ifAbsentPut: [ self privateChildrenSelectorsIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> childrenTypesIn: aMetamodel [
	^ aMetamodel additionalProperty: #childrenTypes for: self ifAbsentPut: [ self privateChildrenTypesIn: aMetamodel ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> dependencyFM3PropertyDescriptionIn: aMetamodel [
	"finds in aMetamodel all properties that are associations or declared dependencies,
	 (obviously aMetamodel should contain the class self)"
	aMetamodel ifNil: [ ^ OrderedCollection new ].
	^ (self allDeclaredPropertiesIn: aMetamodel)
		select: [ :e | e hasOpposite and: [ 
				(e opposite isSource or:
				[ e opposite isTarget ]) or:
					[ e isDependencySource or: [e isDependencyTarget] ] ] ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> incomingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #incomingAssociationTypes for: self ifAbsentPut: [ self privateIncomingAssociationTypesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> incomingMSEPropertiesIn: aMetamodel [
	"computes all properties that are target of association for self (a class) belonging to aMetamodel"

	self flag: 'For non-association properties that we would like to be dependencies I think it should return the opposite of the non-association properties since we are in the incoming case'.
	^ aMetamodel additionalProperty: #incomingMSEProperties for: self ifAbsentPut: [ self privateIncomingMSEPropertiesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> outgoingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #outgoingAssociationTypes for: self ifAbsentPut: [ self privateOutgoingAssociationTypesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> outgoingMSEPropertiesIn: aMetamodel [

	^ aMetamodel additionalProperty: #outgoingMSEProperties for: self ifAbsentPut: [ self privateOutgoingMSEPropertiesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> parentSelectorsIn: aMetamodel [

	^ aMetamodel additionalProperty: #parentSelectors for: self ifAbsentPut: [ self privateParentSelectorsIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> parentTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #parentTypes for: self ifAbsentPut: [ self privateParentTypesIn: aMetamodel ]
	
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateAllChildrenTypesIn: aMetamodel [
	"Instead of checking if we are using TEntityMetaLevolDependency it would be better to implement #childrenTypesIn: on Trait, but it is currently impossible because all methods whose selector is present in Trait, Class, Behavior are not copied to users. If we denife the method on Trait then the one of TEntityMetaLevelDependency will not be present in the users."

	^ ((self childrenTypesIn: aMetamodel)
		withDeepCollect: [ :each | (each usesFamixTrait: TEntityMetaLevelDependency) ifTrue: [ each childrenTypesIn: aMetamodel ] ifFalse: [ #() ] ]
		as: Set) asOrderedCollection
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateAllIncomingAssociationTypesIn: aMetamodel [
   ^ (((self allChildrenTypesIn: aMetamodel) flatCollectAsSet: [:each | each implementingClassesIn: aMetamodel ])
		flatCollectAsSet: [ :each | each incomingAssociationTypesIn: aMetamodel])
       addAll: (self incomingAssociationTypesIn: aMetamodel);
       yourself
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateAllOutgoingAssociationTypesIn: aMetamodel [
   ^ (((self allChildrenTypesIn: aMetamodel) flatCollectAsSet: [:each | each implementingClassesIn: aMetamodel ])
		flatCollectAsSet: [ :each | each outgoingAssociationTypesIn: aMetamodel])
       addAll: (self outgoingAssociationTypesIn: aMetamodel);
       yourself
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateAllParentTypesIn: aMetamodel [
	"Instead of checking if we are using TEntityMetaLevolDependency it would be better to implement #parentTypesIn: on Trait, but it is currently impossible because all methods whose selector is present in Trait, Class, Behavior are not copied to users. If we denife the method on Trait then the one of TEntityMetaLevelDependency will not be present in the users."

	^ ((self parentTypesIn: aMetamodel)
		withDeepCollect: [ :each | (each usesFamixTrait: TEntityMetaLevelDependency) ifTrue: [ each parentTypesIn: aMetamodel ] ifFalse: [ #() ] ]
		as: Set) asOrderedCollection
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateChildrenSelectorsIn: aMetamodel [
	^ (self allDeclaredPropertiesIn: aMetamodel) select: #isChildrenProperty thenCollect: #implementingSelector
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateChildrenTypesIn: aMetamodel [
	| childrenImplementingClasses childrenUsers |
	childrenImplementingClasses := ((self allDeclaredPropertiesIn: aMetamodel) select: #isChildrenProperty) collect: #implementingType.

	childrenUsers := aMetamodel concreteImplementingClasses select: [ :e | e allGeneratedTraits includesAny: childrenImplementingClasses ].

	^ (childrenImplementingClasses , childrenUsers flatCollect: #withAllSubclasses as: Set) asArray	"<== This could later be #removeDuplicates but it is currently broken on arrays. See https://github.com/pharo-project/pharo/issues/4850"
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateIncomingAssociationTypesIn: aMetamodel [
	"collects all association for which self class is target
	 Since #incomingMSEPropertiesIn: also returns declared dependencies, they must be rejected"
	^ (self incomingMSEPropertiesIn: aMetamodel)
		reject: #isDependencyTarget
		thenCollect: #implementingType
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateIncomingMSEPropertiesIn: aMetamodel [
	^(self dependencyFM3PropertyDescriptionIn: aMetamodel)
		select: [ :p |
			p opposite isTarget or:
			[ p isDependencyTarget ]
		]
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateOutgoingAssociationTypesIn: aMetamodel [
	"collects all association for which self class is source
	 Since #outgoingMSEPropertiesIn: also returns declared dependencies, they must be rejected"
	^ (self outgoingMSEPropertiesIn: aMetamodel)
		reject: #isDependencySource
		thenCollect: #implementingType
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateOutgoingMSEPropertiesIn: aMetamodel [
	"computes all properties that are sources of association for self (a class) belonging to aMetamodel"
	^(self dependencyFM3PropertyDescriptionIn: aMetamodel)
		select: [ :p |
			p opposite isSource or:
			[ p isDependencySource ]
		]
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateParentSelectorsIn: aMetamodel [
	^ (self allDeclaredPropertiesIn: aMetamodel) select: #isContainer thenCollect: #implementingSelector
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateParentTypesIn: aMetamodel [
	| containerImplementingClasses containerUsers |
	containerImplementingClasses := (self allDeclaredPropertiesIn: aMetamodel)
		select: #isContainer
		thenCollect: #implementingType.

	containerUsers := (aMetamodel concreteImplementingClasses select: [ :e | e allGeneratedTraits includesAny: containerImplementingClasses ])
		flatCollect: #withAllSubclasses.

	^ (containerImplementingClasses , containerUsers flatCollect: #withAllSubclasses as: Set) asArray	"<== This could later be #removeDuplicates but it is currently broken on arrays. See https://github.com/pharo-project/pharo/issues/4850"
]

{ #category : #private }
TEntityMetaLevelDependency >> addAllChildrenIn: aCollection [
	self children
		do: [ :each | 
			aCollection add: each.
			each addAllChildrenIn: aCollection ].
	^ aCollection
]

{ #category : #private }
TEntityMetaLevelDependency >> addAllParentsIn: aCollection [
	self
		parentsDo: [ :each | 
			aCollection add: each.
			each addAllParentsIn: aCollection ].
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allAtAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are up in the containment tree of the metamodel"

	^ self query ancestors recursively forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allAtAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are up in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query ancestors recursively until: rejectBlock) forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allAtScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are up in the containment tree of the metamodel on multiple levels."

	^ self query ancestors recursively for: aClassFAMIX
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allAtScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the entities at a given famix class scope that are up in the containment tree of the metamodel on multiple levels.
	I stop the recursion when the rejectBlock is true."

	^ (self query ancestors recursively until: rejectBlock) for: aClassFAMIX
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allChildren [
	"Returns all the children and sub-children of an entity, i.e my children and those of my children, and those of the children of my children, etc"

	^ self addAllChildrenIn: OrderedCollection new
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allChildrenTypes [
	^ self class allChildrenTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allClients [
	^ self allClientsAtScope: self class
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allClientsAtScope: aClass [
	^ self queryIncomingDependencies withoutSelfLoops atScope: aClass withNonMatchingEntitiesDo: [ :entities :res | entities ifNotNil: [ res addAll: entities asCollection ] ]
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allIncomingAssociationTypes [

	^ self class allIncomingAssociationTypesIn: self metamodel 
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allOutgoingAssociationTypes [
	^ self class allOutgoingAssociationTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allParentTypes [
	^ self class allParentTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allParents [
	"Returns all the parents and sup-parents of an entity, i.e my parents and those of my parents, and those of the parents of my parents, etc"

	^ self addAllParentsIn: OrderedCollection new
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allProviders [
	^ self allProvidersAtScope: self class
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allProvidersAtScope: aClass [
	^ self queryOutgoingDependencies withoutSelfLoops atScope: aClass withNonMatchingEntitiesDo: [ :entities :res | entities ifNotNil: [ res addAll: entities asCollection ] ]
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allToAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are down in the containment tree of the metamodel"

	^ self query descendants recursively forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allToAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are down in the containment tree of the metamodel
	I stop the recursion when the rejectBlock is true"

	^ (self query descendants recursively until: rejectBlock) forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allToScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are down in the containment tree of the metamodel on multiple levels."

	^ self query descendants recursively for: aClassFAMIX
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allToScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the entities at a given famix class scope that are down in the containment tree of the metamodel on multiple levels.
	I stop the recursion when the rejectBlock is true"

	^ (self query descendants recursively until: rejectBlock) for: aClassFAMIX
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allWithAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the entities (recursively) matching one of the class scope that are up or down in the containment tree of the metamodel"

	^ self query lineage recursively forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allWithAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the entities (recursively) matching one of the class scope that are up or down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query lineage recursively until: rejectBlock) forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allWithScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are up or down in the containment tree of the metamodel on multiple levels."

	^ self query lineage recursively for: aClassFAMIX
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allWithScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the entities at a given famix class scope that are up or down in the containment tree of the metamodel on multiple levels.
	I stop the recursion when the rejectBlock is true"

	^ (self query lineage recursively until: rejectBlock) for: aClassFAMIX
]

{ #category : #scoping }
TEntityMetaLevelDependency >> atAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are up in the containment tree of the metamodel"

	^ self query ancestors forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> atAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are up in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query ancestors until: rejectBlock) forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> atScope: aClassFAMIX [
	"I am used to return all the first encountered entities at a given famix class scope that are up in the containment tree of the metamodel"

	^ self query ancestors for: aClassFAMIX
]

{ #category : #scoping }
TEntityMetaLevelDependency >> atScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the first encountered entities at a given famix class scope that are up in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query ancestors until: rejectBlock) for: aClassFAMIX
]

{ #category : #deprecated }
TEntityMetaLevelDependency >> belongsTo [
	"Return the primary container of the entity if it exist"

	"/!\ Please do not use me. 
	It does not make sense to have a 'primary' container since the models do not have a containment tree but a containment DAG. 
	This method will be deprecated in the future when we will rewrite the users to use #parents."

	^ self parents ifNotEmpty: #anyOne ifEmpty: [ nil ]
]

{ #category : #deprecated }
TEntityMetaLevelDependency >> belongsTo: anEntity [
	self deprecated: 'belongsTo will be removed in the future. Use the explicit setter for the property you''re trying to set instead. Such has #parentScope, #typeContainer, ...'
]

{ #category : #accessing }
TEntityMetaLevelDependency >> children [
	| res |
	res := Set new.
	self childrenSelectors do: [ :accessor | (self perform: accessor) ifNotNil: [ :r | res addAll: r asCollection ] ].
	^ res
]

{ #category : #accessing }
TEntityMetaLevelDependency >> childrenSelectors [
	^ self class childrenSelectorsIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> childrenTypes [
	^ self class childrenTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> dependencyFM3PropertyDescription [
	^ self class dependencyFM3PropertyDescriptionIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> incomingAssociationTypes [
	^ self class incomingAssociationTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> incomingMSEProperties [
	^ self class incomingMSEPropertiesIn: self metamodel
]

{ #category : #testing }
TEntityMetaLevelDependency >> isIncludedIn: anEntity parentSelectorsCache: parentSelectorsCache [
	"We use a cache for the parents selector for performances reasons. It might be really long to perform the #withoutSelfLoops thus we need to speed it up a maximum.
	
	[ (model allUsing: TEntityMetaLevelDependency) collect: [ :e | e  queryIncomingDependencies withoutSelfLoops ] ] timeToRun."

	self = anEntity ifTrue: [ ^ true ].

	(parentSelectorsCache at: self class ifAbsentPut: [ self parentSelectors ])
		do: [ :accessor | (self perform: accessor) ifNotNil: [ :parent | (parent isIncludedIn: anEntity parentSelectorsCache: parentSelectorsCache) ifTrue: [ ^ true ] ] ].

	^ false
]

{ #category : #accessing }
TEntityMetaLevelDependency >> numberOfChildren [
	<FMProperty: #numberOfChildren type: #Number>
	<FMComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	^ self isContainerEntity ifTrue: [ self children size ] ifFalse: [ 0 ]
]

{ #category : #accessing }
TEntityMetaLevelDependency >> outgoingAssociationTypes [
	^ self class outgoingAssociationTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> outgoingMSEProperties [
	"finds all properties from entities of 'self class' to other entities"
	^ self class outgoingMSEPropertiesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parentSelectors [
	^ self class parentSelectorsIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parentTypes [
	^ self class parentTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parents [
	| res |
	res := Set new.
	self parentsDo: [ :parent | res add: parent ].
	^ res
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parentsDo: aBlock [
	self parentSelectors do: [ :accessor | (self perform: accessor) ifNotNil: [ :r | aBlock value: r ] ]
]

{ #category : #query }
TEntityMetaLevelDependency >> query [
	^ MooseQuery receiver: self
]

{ #category : #private }
TEntityMetaLevelDependency >> scopeForQuery: aQuery direction: aDirection [
	aDirection scopeFor: self query: aQuery
]

{ #category : #scoping }
TEntityMetaLevelDependency >> toAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are down in the containment tree of the metamodel"

	^ self query descendants forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> toAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query descendants until: rejectBlock) forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> toScope: aClassFAMIX [
	"I am used to return all the first encountered  entities at a given famix class scope that are down in the containment tree of the metamodel"

	^ self query descendants for: aClassFAMIX
]

{ #category : #scoping }
TEntityMetaLevelDependency >> toScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the first encountered  entities at a given famix class scope that are down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query descendants until: rejectBlock) for: aClassFAMIX
]

{ #category : #accessing }
TEntityMetaLevelDependency >> withAllChildren [
	"I return a collection including me and all my children in the containement DAG."

	^ self allChildren
		add: self;
		yourself
]

{ #category : #accessing }
TEntityMetaLevelDependency >> withAllParents [
	"I return a collection including me and all my parents in the containement DAG."

	^ self allParents
		add: self;
		yourself
]

{ #category : #scoping }
TEntityMetaLevelDependency >> withAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the first encountered entities matching one of the class scope that are up or down in the containment tree of the metamodel"

	^ self query lineage forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> withAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the first encountered entities matching one of the class scope that are up or down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query lineage until: rejectBlock) forAny: aCollectionOfFamixClasses
]

{ #category : #scoping }
TEntityMetaLevelDependency >> withScope: aClassFAMIX [
	"I am used to return all the first encountered  entities at a given famix class scope that are up or down in the containment tree of the metamodel"

	^ self query lineage for: aClassFAMIX
]

{ #category : #scoping }
TEntityMetaLevelDependency >> withScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the first encountered  entities at a given famix class scope that are up or down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query lineage until: rejectBlock) for: aClassFAMIX
]
