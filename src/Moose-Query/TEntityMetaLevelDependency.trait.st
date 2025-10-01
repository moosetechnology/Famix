"
Description
--------------------

This trait provides a common, paradigm agnostic vocabulary to query dependencies of software entities.

It includes some generic way to query an entity via its associations. The API offer the possibility to query an entity with three parameters:
- The direction of the navigation (Incoming/Outgoing -- in/out)
- The kind of association (FAMIXAcces, FAMIXReference, all...)
- The scope of the query (The receiver, the receiver and its children)

The actual core of the algorithms are in MooseQueryCalculator class.

Most  of the generic methods takes a symbol to describe the direction. This symbol will be used to find a MooseQueryAbstactDirectionStrategy to configure a MooseQueryCalculator.

For more informations: https://moosequery.ferlicot.fr/

Public API and Key Messages
--------------------

- #query: aSymbol with: aFAMIXAssociation 				Looks for the associations of the kind aFAMIXAssociation in the direction described by the symbol in the receiver and its children.
- #queryLocal: aSymbol with: aFAMIXAssociation 		Looks for the associations of the kind aFAMIXAssociation in the direction described by the symbol in the receiver.
- #queryAll: aSymbol 									Looks for the associations in the direction described by the symbol in the receiver and its children.

There is a lot of other generic queries. You can find all of them in the ""moose-queries-generic"" protocol.

Examples
--------------------

	aFAMIXClass query: #in with: FAMIXInheritance.
		--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as target
			
	aFAMIXMethod query: #out with: FAMIXAccess.
		--> Will return a MooseOutgoingQueryResult containing the FAMIXAccess associations having aFAMIXMethod or its children as source
	
	
	aFAMIXClass queryLocal: #in with: FAMIXInheritance.
		--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass as target
	
	aFAMIXMethod queryLocal: #out with: FAMIXAccess.
		--> Will return a MooseOutgoingQueryResult containing the FAMIXAccess associations having aFAMIXMethod as source		
	
			
	aFAMIXClass queryAll: #in.
		--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as target
	
	aFAMIXMethod queryAll: #out.
		--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXMethod or its children as source
	
		
	aFAMIXClass queryAllLocal: #in.
		--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass as target
	
	aFAMIXMethod queryAllLocal: #out.
		--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXMethod as source


"
Trait {
	#name : 'TEntityMetaLevelDependency',
	#category : 'Moose-Query-Traits',
	#package : 'Moose-Query',
	#tag : 'Traits'
}

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> allChildrenTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allChildrenTypes for: self ifAbsentPut: [ self privateAllContainedEntityTypesIn: aMetamodel ]
	
]

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> allContainerTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allContainerTypes for: self ifAbsentPut: [ self privateAllContainerTypesIn: aMetamodel ]
	
]

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> allIncomingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allIncomingAssociationTypes for: self ifAbsentPut: [ self privateAllIncomingAssociationTypesIn: aMetamodel ]
	
]

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> allOutgoingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allOutgoingAssociationTypes for: self ifAbsentPut: [ self privateAllOutgoingAssociationTypesIn: aMetamodel ]
	
]

{ #category : 'meta' }
TEntityMetaLevelDependency classSide >> annotation [

	<FMClass: #TEntityMetaLevelDependency super: #Object>
	<package: #'Moose-Query'>
	<generated>
	^ self
]

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> containedEntitySelectorsIn: aMetamodel [

	^ aMetamodel additionalProperty: #containedEntitySelectors for: self ifAbsentPut: [ self privateContainedEntitySelectorsIn: aMetamodel ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> containedEntityTypesIn: aMetamodel [
	^ aMetamodel additionalProperty: #containedEntityTypes for: self ifAbsentPut: [ self privateContainedEntityTypesIn: aMetamodel ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> containerSelectorsIn: aMetamodel [

	^ aMetamodel additionalProperty: #containerSelectors for: self ifAbsentPut: [ self privateContainerSelectorsIn: aMetamodel ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> containerTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #containerTypes for: self ifAbsentPut: [ self privateContainerTypesIn: aMetamodel ]
	
]

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> incomingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #incomingAssociationTypes for: self ifAbsentPut: [ self privateIncomingAssociationTypesIn: aMetamodel ]
	
]

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> incomingFamePropertiesIn: aMetamodel [
	"computes all properties that are target of association for self (a class) belonging to aMetamodel"

	^ aMetamodel additionalProperty: #incomingFameProperties for: self ifAbsentPut: [ self privateIncomingFamePropertiesIn: aMetamodel ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> outgoingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #outgoingAssociationTypes for: self ifAbsentPut: [ self privateOutgoingAssociationTypesIn: aMetamodel ]
	
]

{ #category : 'accessing' }
TEntityMetaLevelDependency classSide >> outgoingFamePropertiesIn: aMetamodel [

	^ aMetamodel additionalProperty: #outgoingFameProperties for: self ifAbsentPut: [ self privateOutgoingFamePropertiesIn: aMetamodel ]
	
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateAllContainedEntityTypesIn: aMetamodel [
	"Instead of checking if we are using TEntityMetaLevolDependency it would be better to implement #childrenTypesIn: on Trait, but it is currently impossible because all methods whose selector is present in Trait, Class, Behavior are not copied to users. If we denife the method on Trait then the one of TEntityMetaLevelDependency will not be present in the users."

	^ ((self containedEntityTypesIn: aMetamodel)
		withDeepCollect: [ :each | (each usesFamixTrait: TEntityMetaLevelDependency) ifTrue: [ each containedEntityTypesIn: aMetamodel ] ifFalse: [ #() ] ]
		as: Set) asOrderedCollection
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateAllContainerTypesIn: aMetamodel [
	"Instead of checking if we are using TEntityMetaLevolDependency it would be better to implement #parentTypesIn: on Trait, but it is currently impossible because all methods whose selector is present in Trait, Class, Behavior are not copied to users. If we denife the method on Trait then the one of TEntityMetaLevelDependency will not be present in the users."

	^ ((self containerTypesIn: aMetamodel)
		   withDeepCollect: [ :each |
				   (each usesFamixTrait: TEntityMetaLevelDependency)
					   ifTrue: [ each containerTypesIn: aMetamodel ]
					   ifFalse: [ #(  ) ] ]
		   as: Set) asOrderedCollection
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateAllIncomingAssociationTypesIn: aMetamodel [
   ^ (((self allChildrenTypesIn: aMetamodel) flatCollectAsSet: [:each | each implementingClassesIn: aMetamodel ])
		flatCollectAsSet: [ :each | each incomingAssociationTypesIn: aMetamodel])
       addAll: (self incomingAssociationTypesIn: aMetamodel);
       yourself
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateAllOutgoingAssociationTypesIn: aMetamodel [
   ^ (((self allChildrenTypesIn: aMetamodel) flatCollectAsSet: [:each | each implementingClassesIn: aMetamodel ])
		flatCollectAsSet: [ :each | each outgoingAssociationTypesIn: aMetamodel])
       addAll: (self outgoingAssociationTypesIn: aMetamodel);
       yourself
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateContainedEntitySelectorsIn: aMetamodel [
	^ (self allDeclaredPropertiesIn: aMetamodel) select: #isChildrenProperty thenCollect: #implementingSelector
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateContainedEntityTypesIn: aMetamodel [
	| childrenImplementingClasses childrenUsers |
	childrenImplementingClasses := ((self allDeclaredPropertiesIn: aMetamodel) select: #isChildrenProperty) collect: #implementingType.

	childrenUsers := aMetamodel concreteImplementingClasses select: [ :e | e allGeneratedTraits includesAny: childrenImplementingClasses ].

	^ (childrenImplementingClasses , childrenUsers flatCollect: #withAllSubclasses as: Set) asArray	"<== This could later be #removeDuplicates but it is currently broken on arrays. See https://github.com/pharo-project/pharo/issues/4850"
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateContainerSelectorsIn: aMetamodel [
	^ (self allDeclaredPropertiesIn: aMetamodel) select: #isContainer thenCollect: #implementingSelector
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateContainerTypesIn: aMetamodel [
	| containerImplementingClasses containerUsers |
	containerImplementingClasses := (self allDeclaredPropertiesIn: aMetamodel)
		select: #isContainer
		thenCollect: #implementingType.

	containerUsers := (aMetamodel concreteImplementingClasses select: [ :e | e allGeneratedTraits includesAny: containerImplementingClasses ])
		flatCollect: #withAllSubclasses.

	^ (containerImplementingClasses , containerUsers flatCollect: #withAllSubclasses as: Set) asArray	"<== This could later be #removeDuplicates but it is currently broken on arrays. See https://github.com/pharo-project/pharo/issues/4850"
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateIncomingAssociationTypesIn: aMetamodel [
	"Collects all reified associations for which self class is target.
	 
	To find they, we select my properties who have an opposite which is a targer. 
	We reject the properties that are source because a source with a target as opposite is not a reified dependency using and association."

	^ ((self allDeclaredPropertiesIn: aMetamodel) select: [ :p | p hasOpposite and: [ p opposite isTarget and: [ p isSource not ] ] ]) collect: #implementingType
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateIncomingFamePropertiesIn: aMetamodel [
	"Collects all fame properties defining an incoming dependency to self.
	
	An incoming dependency is reified by an association.	
	My property has an opposite, that is the property of the association. This property is target.
	Since the direction of the relation is defined in the association, my property is not source, nor target."

	^ (self allDeclaredPropertiesIn: aMetamodel) select: [ :p | p hasOpposite and: [ p opposite isTarget and: [ p isSource not ] ] ]
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateOutgoingAssociationTypesIn: aMetamodel [
	"Collects all reified associations for which self class is source.
	 
	To find they, we select my properties who have an opposite which is a source. 
	We reject the properties that are target because a target with a source as opposite is not a reified dependency using and association."

	^ ((self allDeclaredPropertiesIn: aMetamodel) select: [ :p | p hasOpposite and: [ p opposite isSource and: [ p isTarget not ] ] ]) collect: #implementingType
]

{ #category : 'private' }
TEntityMetaLevelDependency classSide >> privateOutgoingFamePropertiesIn: aMetamodel [
	"Collects all fame properties defining a outgoing dependency to self.
	
	An outgoing dependency is reified by an association.	
	My property has an opposite, that is the property of the association. This property is source.
	Since the direction of the relation is defined in the association, my property is not source, nor target."

	^ (self allDeclaredPropertiesIn: aMetamodel) select: [ :p | p hasOpposite and: [ p opposite isSource and: [ p isTarget not ] ] ]
]

{ #category : 'private' }
TEntityMetaLevelDependency >> addAllContainedEntitiesIn: aCollection [
	self children
		do: [ :each | 
			aCollection add: each.
			each addAllContainedEntitiesIn: aCollection ].
	^ aCollection
]

{ #category : 'private' }
TEntityMetaLevelDependency >> addAllContainersIn: aCollection [

	self containersDo: [ :container |
			aCollection add: container.
			container addAllContainersIn: aCollection ].
	^ aCollection
]

{ #category : 'private' }
TEntityMetaLevelDependency >> addRootContainersIn: aCollection [

	self containersDo: [ :container |
			container isRoot
				ifTrue: [ aCollection add: container ]
				ifFalse: [ container addAllContainersIn: aCollection ] ].
	^ aCollection
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> allAtAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are up in the containment tree of the metamodel"

	^ self query containers recursively ofAnyType: aCollectionOfFamixClasses
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> allAtAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are up in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query containers recursively until: rejectBlock) ofAnyType: aCollectionOfFamixClasses
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> allAtScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are up in the containment tree of the metamodel on multiple levels."

	^ self query containers recursively ofType: aClassFAMIX
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> allAtScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the entities at a given famix class scope that are up in the containment tree of the metamodel on multiple levels.
	I stop the recursion when the rejectBlock is true."

	^ (self query containers recursively until: rejectBlock) ofType: aClassFAMIX
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allChildren [
	"Returns all the children and sub-children of an entity, i.e my children and those of my children, and those of the children of my children, etc"

	^ self addAllContainedEntitiesIn: OrderedCollection new
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allChildrenTypes [
	^ self class allChildrenTypesIn: self metamodel
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allClients [

	^ self cacheAt: #allClients ifAbsent: [ (self queryAllIncoming withoutSelfLoops collect: #source) flattened ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allClientsAtMyScope [

	^ self cacheAt: #allClientsAtMyScope ifAbsent: [ self allClientsAtScope: self class ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allClientsAtScope: aClass [
"Attention, this method returns only the clients at the requested scope. The other clients non matching the scope are not return. Like this we are sure that all the return entities are at the requested scope"
	^ self queryAllIncoming withoutSelfLoops
		atScope: aClass
		
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allContainerTypes [

	^ self class allContainerTypesIn: self metamodel
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allContainers [
	"Returns all the containers and sup-containers of an entity, i.e my containers and those of my containers, and those of the containers of my containers, etc"

	^ self addAllContainersIn: OrderedCollection new
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allIncomingAssociationTypes [

	^ self class allIncomingAssociationTypesIn: self metamodel 
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allOutgoingAssociationTypes [
	^ self class allOutgoingAssociationTypesIn: self metamodel
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allProviders [

	^ self cacheAt: #allProviders ifAbsentPut: [ (self queryAllOutgoing withoutSelfLoops collect: #target) flattened ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allProvidersAtMyScope [

	^ self cacheAt: #allProvidersAtMyScope ifAbsent: [ self allProvidersAtScope: self class ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> allProvidersAtScope: aClass [
"Attention, this method returns only the providers at the requested scope. The other providers non matching the scope are not return. Like this we are sure that all the return entities are at the requested scope"
	^ self queryAllOutgoing withoutSelfLoops
		atScope: aClass
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> allToAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are down in the containment tree of the metamodel"

	^ self query containedEntities recursively ofAnyType: aCollectionOfFamixClasses
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> allToAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are down in the containment tree of the metamodel
	I stop the recursion when the rejectBlock is true"

	^ (self query containedEntities recursively until: rejectBlock) ofAnyType: aCollectionOfFamixClasses
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> allToScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are down in the containment tree of the metamodel on multiple levels."

	^ self query containedEntities recursively ofType: aClassFAMIX
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> allToScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the entities at a given famix class scope that are down in the containment tree of the metamodel on multiple levels.
	I stop the recursion when the rejectBlock is true"

	^ (self query containedEntities recursively until: rejectBlock) ofType: aClassFAMIX
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> atAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are up in the containment tree of the metamodel"

	^ self query containers ofAnyType: aCollectionOfFamixClasses
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> atAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are up in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query containers until: rejectBlock) ofAnyType: aCollectionOfFamixClasses
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> atScope: aClassFAMIX [
	"I am used to return all the first encountered entities at a given famix class scope that are up in the containment tree of the metamodel"

	^ self query containers ofType: aClassFAMIX
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> atScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the first encountered entities at a given famix class scope that are up in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query containers until: rejectBlock) ofType: aClassFAMIX
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> atScopeWithProperty: aPropertySelector [
	"I am used to return the first encountered entity that are up in the containment tree of the metamodel satisfying the property selector"

	^ self query containers withProperty: aPropertySelector
]

{ #category : 'deprecated' }
TEntityMetaLevelDependency >> belongsTo [
	"Return the primary container of the entity if it exist"

	"/!\ Please do not use me. 
	It does not make sense to have a 'primary' container since the models do not have a containment tree but a containment DAG. 
	This method will be deprecated in the future when we will rewrite the users to use #parents."

	^ self containers
		  ifNotEmpty: #anyOne
		  ifEmpty: [ nil ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> containedEntities [

	| res |
	res := OrderedCollection new.
	self containedEntitySelectors do: [ :accessor |
			(self perform: accessor) ifNotNil: [ :r |
					r isCollection
						ifTrue: [ res addAll: r ]
						ifFalse: [ res add: r ] ] ].
	^ res
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> containedEntitySelectors [

	^ self class containedEntitySelectorsIn: self metamodel
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> containedEntityTypes [

	^ self class containedEntityTypesIn: self metamodel
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> containerSelectors [

	^ self class containerSelectorsIn: self metamodel
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> containerTypes [

	^ self class containerTypesIn: self metamodel
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> containers [

	| res |
	res := OrderedCollection new.
	self containersDo: [ :parent | res add: parent ].
	^ res
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> containersDo: aBlock [

	self containerSelectors do: [ :accessor | (self perform: accessor) ifNotNil: [ :r | aBlock value: r ] ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> fanIn [
	<FMProperty: #fanIn type: #Number>
	<derived>
	<FMComment: 'Number of incoming links'>
	^ self allClients size
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> fanOut [
	<FMProperty: #fanOut type: #Number>
	<derived>
	<FMComment: 'Number of provider'>
	^ self allProviders size
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> has: anInOutSymbol [
	"Check the incoming or outgoing associations of the receiver or its children.

	Example:
		aFAMIXClass has: #in.
			--> Will return trye if aFAMIXMethod has the incoming FAMIXAssociation 
		aFAMIXMethod has: #out.
			--> Will return true if aFAMIXMethod has the outgoing FAMIXAssociation
	"

	^ (self query navigation: anInOutSymbol) has dependencies
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> has: anInOutSymbol with: aFAMIXClassAssociation [
	"Query all the incoming or outgoing associations of the FAMIXClassAssociation class for the receiver and its children.

	Example:
		aFAMIXClass query: #in with: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as target
		aFAMIXMethod query: #out with: FAMIXAccess.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAccess associations having aFAMIXMethod or its children as source
	"

	^ (self query navigation: anInOutSymbol) has dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> hasIncoming [
	"Checks for incoming associations of the receiver and its children.

	Example:
		aFAMIXClass hasIncoming.
			--> --> Will return true if the receiver or its children have incoming associations
	"

	^ self query has incoming dependencies
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> hasIncoming: aFAMIXClassAssociation [
	"Checks for incoming associations of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXClass hasIncoming: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has incoming associations of the FAMIXClassAssociation class for the receiver or its children.
	"

	^ self query has incoming dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> hasLocal: anInOutSymbol [
	"Check the incoming or outgoing associations of the receiver.

	Example:
		aFAMIXClass hasLocal: #in.
			--> Will return trye if aFAMIXMethod has the incoming FAMIXAssociation 
		aFAMIXMethod hasLocal: #out.
			--> Will return true if aFAMIXMethod has the outgoing FAMIXAssociation
	"

	^ (self query navigation: anInOutSymbol) has local dependencies
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> hasLocalIncoming [
	"Check the incoming or outgoing associations of the receiver.

	Example:
		aFAMIXClass hasLocalIncoming
			--> Will return true if aFAMIXMethod has the incoming FAMIXAssociation 
			"

	^ self query has local incoming dependencies
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> hasLocalIncoming: aFAMIXClassAssociation [
	"Checks for incoming associations of the FAMIXClassAssociation class for the receiver
	
	Example:
		aFAMIXClass hasIncoming: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has incoming associations of the FAMIXClassAssociation class for the receiver.
	"

	^ self query has local incoming dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> hasLocalOutgoing [
	"Checks for outgoing associations of the receiver.
	
	Example:
		aFAMIXClass hasOutgoing
			--> Will return true if the receiver has outgoingInvocation.
	"

	^ self query has local outgoing dependencies
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> hasLocalOutgoing: aFAMIXClassAssociation [
	"Checks for outgoing associations of the FAMIXClassAssociation class for the receiver.
	
	Example:
		aFAMIXClass hasIncoming: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has incoming associations of the FAMIXClassAssociation class for the receiver.
	"

	^ self query has local outgoing dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> hasOutgoing [
	"Checks for outgoing associations of the receiver and its children.

	Example:
		aFAMIXClass hasOutgoing.
			--> --> Will return true if the receiver or its children have outgoing associations
	"

	^ self query has outgoing dependencies
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> hasOutgoing: aFAMIXClassAssociation [
	"Checks for outgoing associations of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXClass hasOutgoing: FAMIXInheritance.
			--> Will return true if aFAMIXClassAssociation has outgoing associations of the FAMIXClassAssociation class for the receiver or its children.
	"

	^ self query has outgoing dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> incomingAssociationTypes [
	^ self class incomingAssociationTypesIn: self metamodel
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> incomingFameProperties [
	^ self class incomingFamePropertiesIn: self metamodel
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> isIncludedIn: anEntity containerSelectorsCache: containerSelectorsCache [
	"We use a cache for the container selectors for performances reasons. It might be really long to perform the #withoutSelfLoops thus we need to speed it up a maximum.
	
	[ (model allUsing: TEntityMetaLevelDependency) collect: [ :e | e  queryIncomingDependencies withoutSelfLoops ] ] timeToRun."

	| selectors |
	self = anEntity ifTrue: [ ^ true ]. "Instead of #to:do: we could just use #do: but this implementation is much faster. Maybe sista will remove the needs of the todo later."
	1 to: (selectors := containerSelectorsCache at: self class ifAbsentPut: [ self containerSelectors ]) size do: [ :ind |
	((self perform: (selectors at: ind)) isIncludedIn: anEntity containerSelectorsCache: containerSelectorsCache) ifTrue: [ ^ true ] ].

	^ false
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> isQueryable [

	<generated>
	^ true
]

{ #category : 'testing' }
TEntityMetaLevelDependency >> isRoot [
	"Old implementation: self parents isEmpty
	This implementation is faster."

	<FMProperty: #isRoot type: #Boolean>
	<derived>
	<FMComment:
	'An entity is root if it has no parent in the model. This is useful for example to be able to build visualization where the displayed elements are the roots of the model and to let those elements be expanded to display their children.'>
	self containersDo: [ :parent | ^ false ].
	^ true
]

{ #category : 'inspector' }
TEntityMetaLevelDependency >> miInspectionTree: aBuilder [

	<inspectorPresentationOrder: 15 title: 'Tree'>
	^ aBuilder newTreeTable
		  addColumn: (SpCompositeTableColumn new
				   addColumn: ((SpImageTableColumn evaluated: #mooseIcon)
						    width: 20;
						    yourself);
				   addColumn: (SpStringTableColumn evaluated: #name);
				   yourself);
		  children: [ :aClass | aClass children asArray ];
		  beMultipleSelection;
		  roots: { self };
		  beResizable
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> numberOfChildren [
	<FMProperty: #numberOfChildren type: #Number>
	<FMComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	^ self isContainerEntity ifTrue: [ self children size ] ifFalse: [ 0 ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> numberOfExternalClients [

	<FMProperty: #numberOfExternalClients type: #Number>
	<derived>
	<FMComment: 'Number of call from myself to outside my container.'>
	^ self cacheAt: #numberOfExternalClients ifAbsentPut: [ (self allClients reject: [ :entity | entity allContainers includesAny: self containers ]) size ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> numberOfExternalProviders [

	<FMProperty: #numberOfExternalProviders type: #Number>
	<derived>
	<FMComment: 'Number of call to myself from outside my container.'>
	^ self cacheAt: #numberOfExternalProviders ifAbsentPut: [ (self allProviders reject: [ :entity | entity allContainers includesAny: self containers ]) size ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> numberOfInternalClients [

	<FMProperty: #numberOfInternalClients type: #Number>
	<derived>
	<FMComment: 'Number of call from myself to entities of my container.'>
	^ self cacheAt: #numberOfInternalClients ifAbsentPut: [ (self allClients select: [ :entity | entity allContainers includesAny: self containers ]) size ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> numberOfInternalProviders [

	<FMProperty: #numberOfInternalProviders type: #Number>
	<derived>
	<FMComment: 'Number of call to myself from entities from my container.'>
	^ self cacheAt: #numberOfInternalProviders ifAbsentPut: [ (self allProviders select: [ :entity | entity allContainers includesAny: self containers ]) size ]
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> outgoingAssociationTypes [
	^ self class outgoingAssociationTypesIn: self metamodel
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> outgoingFameProperties [
	"finds all properties from entities of 'self class' to other entities"

	^ self class outgoingFamePropertiesIn: self metamodel
]

{ #category : 'query' }
TEntityMetaLevelDependency >> query [
	^ MooseQuery receiver: self
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> query: anInOutSymbol with: aFAMIXClassAssociation [
	"Query all the incoming or outgoing associations of the FAMIXClassAssociation class for the receiver and its children.

	Example:
		aFAMIXClass query: #in with: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as target
		aFAMIXMethod query: #out with: FAMIXAccess.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAccess associations having aFAMIXMethod or its children as source
	"

	^ (self query navigation: anInOutSymbol) dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> queryAll: anInOutSymbol [
	"Query all the incoming or outgoing associations of the receiver or its children.

	Example:
		aFAMIXClass queryAll: #in.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as target
		aFAMIXMethod queryAll: #out.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXMethod or its children as source
	"

	^ (self query navigation: anInOutSymbol) dependencies
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> queryAllIncoming [
	"Query all the incoming associations of the receiver and its children.

	Example:
		aFAMIXClass queryAllIncoming.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as target
	"

	^ self query incoming dependencies
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> queryAllLocal: anInOutSymbol [
	"Query all the incoming or outgoing associations of the receiver.
	This method differ from #queryAll: in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryAllLocal: #in.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass as target
		aFAMIXMethod queryAllLocal: #out.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXMethod as source
	"

	^ (self query navigation: anInOutSymbol) local dependencies
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> queryAllLocalIncoming [
	"Query all the incoming associations of the receiver.
	This method differ from #queryAllIncoming in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryAllLocalIncoming.
			--> Will return a MooseIncomingQueryResult containing the FAMIXAssociation having aFAMIXClass as target
	"

	^ self query incoming local dependencies
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> queryAllLocalOutgoing [
	"Query all the outgoing associations of the receiver.
	This method differ from #queryAllOutgoing in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryAllLocalOutgoing.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXClass as source
	"

	^ self query outgoing local dependencies
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> queryAllOutgoing [
	"Query all the outgoing associations of the receiver and its children.

	Example:
		aFAMIXClass queryAllOutgoing.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAssociation having aFAMIXClass or its children as source
	"

	^ self query outgoing dependencies
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> queryIncoming: aFAMIXClassAssociation [
	"Query all the incoming associations of the FAMIXClassAssociation class for the receiver and its children.

	Example:
		aFAMIXClass queryIncoming: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as target
	"

	^ self query incoming dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> queryLocal: anInOutSymbol with: aFAMIXClassAssociation [
	"Query all the incoming or outgoing associations of the FAMIXClassAssociation class for the receiver.
	This method differ from #query:with: in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryLocal: #in with: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass as target
		aFAMIXMethod queryLocal: #out with: FAMIXAccess.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXAccess associations having aFAMIXMethod as source
	"

	^ (self query navigation: anInOutSymbol) local dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> queryLocalIncoming: aFAMIXClassAssociation [
	"Query all the incoming associations of the FAMIXClassAssociation class for the receiver.
	This method differ from #queryIncoming: in the fact that it will not check the associations of the reicever's children.

	Example:
		aFAMIXClass queryLocalIncoming: FAMIXInheritance.
			--> Will return a MooseIncomingQueryResult containing the FAMIXInheritance associations having aFAMIXClass as target
	"

	^ self query incoming local dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> queryLocalOutgoing: aFAMIXClassAssociation [
	"Query all the outgoing associations of the FAMIXClassAssociation class for the receiver.
	This method differ from #queryOutgoing: in the fact that it will not check the associations of the reicever's children.
	
	Example:
		aFAMIXClass queryLocalOutgoing: FAMIXInheritance.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXInheritance associations having aFAMIXClass as source
	"

	^ self query outgoing local dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> queryOutgoing: aFAMIXClassAssociation [
	"Query all the outgoing associations of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXClass queryOutgoing: FAMIXInheritance.
			--> Will return a MooseOutgoingQueryResult containing the FAMIXInheritance associations having aFAMIXClass or its children as source
	"

	^ self query outgoing dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> rootContainers [

	^ self addRootContainersIn: OrderedCollection new
]

{ #category : 'private' }
TEntityMetaLevelDependency >> scopeForQuery: aQuery direction: aDirection [
	aDirection scopeFor: self query: aQuery
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> sourceThrough: aFAMIXClassAssociation [
	"Collect the source of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXClass sourceThrough: FAMIXReference.
			--> Will return a MooseIncomingQueryResult containing the methods having aFAMIXClass or its children as source
	"

	^ self query incoming objects dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> targetThrough: aFAMIXClassAssociation [
	"Collect the target of the FAMIXClassAssociation class for the receiver and its children.
	
	Example:
		aFAMIXMethod targetThrough: FAMIXReference.
			--> Will return a MooseOutgoingQueryResult containing the class having aFAMIXClass or its children as target
	"

	^ self query outgoing objects dependenciesOfType: aFAMIXClassAssociation
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> throughAllFrom [
	"Query all the incoming associations of the receiver and its children.

	Example:
		aFAMIXClass throughAllFrom.
			--> Will return a MooseIncomingQueryResult containing all the FAMIXAssociations having aFAMIXClass or its children as target
	"

	^ self query incoming objects dependencies
]

{ #category : 'query dependencies' }
TEntityMetaLevelDependency >> throughAllTo [
	"Collect all the targets of the receiver and its children.
	
	Example:
		aFAMIXMethod throughAllTo.
			--> Will return a MooseOutgoingQueryResult containing the class having aFAMIXClass or its children as source
	"

	^ self query outgoing objects dependencies
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> toAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are down in the containment tree of the metamodel"

	^ self query containedEntities ofAnyType: aCollectionOfFamixClasses
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> toAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query containedEntities until: rejectBlock) ofAnyType: aCollectionOfFamixClasses
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> toScope: aClassFAMIX [
	"I am used to return all the first encountered  entities at a given famix class scope that are down in the containment tree of the metamodel"

	^ self query containedEntities ofType: aClassFAMIX
]

{ #category : 'scoping' }
TEntityMetaLevelDependency >> toScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the first encountered  entities at a given famix class scope that are down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self query containedEntities until: rejectBlock) ofType: aClassFAMIX
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> withAllChildren [
	"I return a collection including me and all my children in the containement DAG."

	^ self allChildren
		add: self;
		yourself
]

{ #category : 'accessing' }
TEntityMetaLevelDependency >> withAllContainers [
	"I return a collection including me and all my containers in the containement DAG."

	^ self allContainers
		  add: self;
		  yourself
]
