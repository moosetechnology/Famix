"
## Relations
======================

### Parents
- Relation: #parentPackage Type: #FamixTPackage Opposite: #childEntities Comment: Package containing the entity in the code structure (if applicable)
- Relation: #typeContainer Type: #FamixTWithTypes Opposite: #types Comment: Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).
### Children
- Relation: #methods Type: #FamixTMethod Opposite: #parentType Comment: Methods declared by this type.
- Relation: #attributes Type: #FamixTAttribute Opposite: #parentType Comment: List of attributes declared by this type.
### Outgoing dependencies
- Relation: #outgoingImports Type: #FamixTImport Opposite: #importingEntity
- Relation: #superInheritances Type: #FamixTInheritance Opposite: #subclass Comment: Superinheritance relationships, i.e. known superclasses of this type.
- Relation: #interfaceImplementations Type: #FamixTImplementation Opposite: #implementingClass Comment: Implementation relationships
### Incomming dependencies
- Relation: #incomingImports Type: #FamixTImport Opposite: #importedEntity Comment: List of imports of this entity
- Relation: #subInheritances Type: #FamixTInheritance Opposite: #superclass Comment: Subinheritance relationships, i.e. known subclasses of this type.
- Relation: #incomingReferences Type: #FamixTReference Opposite: #referredType Comment: References to this entity by other entities.
### Other
- Relation: #receivingInvocations Type: #FamixTInvocation Opposite: #receiver Comment: List of invocations performed on this entity (considered as the receiver)
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #typedEntities Type: #FamixTTypedEntity Opposite: #declaredType Comment: Entities that have this type as declaredType
- Relation: #comments Type: #FamixTComment Opposite: #commentedEntity Comment: List of comments for the entity

## Properties
======================

- Named: #isFinal Type: Boolean Comment: Entity can be declared final
- Named: #visibility Type: String Comment: Visibility of the entity
- Named: #isAbstract Type: Boolean Comment: Entity can be declared abstract
- Named: #isClassSide Type: Boolean Comment: Entity can be declared class side i.e. static
- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Class {
	#name : #FamixJavaClass,
	#superclass : #FamixJavaType,
	#traits : 'FamixJavaTClassMetrics + FamixTCanBeAbstract + FamixTCanBeClassSide + FamixTCanBeFinal + FamixTCanImplement + FamixTClass + FamixTClassMetrics + FamixTHasVisibility + FamixTImportable + FamixTLCOMMetrics + FamixTPackageable + FamixTWithImports',
	#classTraits : 'FamixJavaTClassMetrics classTrait + FamixTCanBeAbstract classTrait + FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTCanImplement classTrait + FamixTClass classTrait + FamixTClassMetrics classTrait + FamixTHasVisibility classTrait + FamixTImportable classTrait + FamixTLCOMMetrics classTrait + FamixTPackageable classTrait + FamixTWithImports classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaClass class >> annotation [

	<FMClass: #Class super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixJavaClass >> accessedAttributes [
	
	"Returns my attributes accessed by my methods. If the same attribute is accessed 
	by two different methods it is counted twice.
	Used to support the calculation of LCOM"
	
	^ self methodsWithoutSutbsAndConstructors asOrderedCollection flatCollect: [ :method | method accessedAttributes ]
]

{ #category : #private }
FamixJavaClass >> addMethodOverriding: aMethod in: aCollection [

	self directSubclasses do: [ :subClass |
		subClass methods
			detect: [ :method | method signature = aMethod signature ]
			ifFound: [ :overridingMethod | aCollection add: overridingMethod ]
			ifNone: [ subClass addMethodOverriding: aMethod in: aCollection ] ]
]

{ #category : #enumerating }
FamixJavaClass >> allImplementedInterfacesHierarchy [

	| allImplementedInterfaces |
	allImplementedInterfaces := OrderedCollection new.

	self allImplementedInterfacesHierarchyDo: [ :interface |
		allImplementedInterfaces add: interface ].

	^ allImplementedInterfaces
]

{ #category : #enumerating }
FamixJavaClass >> allImplementedInterfacesHierarchyDo: aBlock [

	self directImplementedInterfaces do: [ :directInterface |
		directInterface withSuperclassesDo: aBlock ]
]

{ #category : #accessing }
FamixJavaClass >> incomingAccesses [
	^ self 
		cacheAt: #incomingAccesses
		ifAbsentPut: [ attributes flatCollect: [ :each | each incomingAccesses ] ]
]

{ #category : #testing }
FamixJavaClass >> isADirectSubclassOf: aClass [
	^ aClass class = FamixJavaClass
		ifTrue: [ aClass directSubclasses includes: self ]
		ifFalse: [ false ]
]

{ #category : #testing }
FamixJavaClass >> isADirectSuperclassOf: aClass [
	^ aClass class = FamixJavaClass
		ifTrue: [ aClass superclass = self ]
		ifFalse: [ false ]
]

{ #category : #testing }
FamixJavaClass >> isASubclassOf: aClass [ 
	 
	^aClass class = FamixJavaClass 
		ifTrue: [aClass subclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #testing }
FamixJavaClass >> isASuperclassOf: aClass [ 
	 
	^aClass class = FamixJavaClass 
		ifTrue: [aClass superclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #testing }
FamixJavaClass >> isAccessedBy: anAccess [ 
	 
	^anAccess accesses == self
]

{ #category : #testing }
FamixJavaClass >> isIgnored [

	"If the class is a test class, it can be annotated with Ignore, all the tests of contained are bypassed"

	self deprecated: 'This method is not supported in VerveineJ'.
	^ self isAnnotatedWith: 'Ignore'
]

{ #category : #testing }
FamixJavaClass >> isInheritedBy: anInheritance [ 
	 
	^anInheritance superclass == self
]

{ #category : #private }
FamixJavaClass >> lookUpInInterfaces: aMethodSignature [

	self allImplementedInterfacesHierarchyDo: [ :interface |
		(interface lookUp: aMethodSignature) ifNotNil: [ :method | ^ method ] ].

	^ self superclass ifNotNil: [ :superclass |
		  superclass lookUpInInterfaces: aMethodSignature ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixJavaClass >> methodsWithoutSutbsAndConstructors [

	"Removing stub and contructor methods. Used to support the calculation of LCOM."
	
	^ (self methods select: [ :each | 
		each isStub not and: [each isConstructor not]]) asSet
]

{ #category : #accessing }
FamixJavaClass >> numberOfComments [
	"Overrides to include method comments in the numberOfComments of the class"
	^ self
		lookUpPropertyNamed: #numberOfComments
		computedAs: [ self children asArray
			inject: self comments size into: [ :sum :child | child numberOfComments + sum ] ]

]

{ #category : #'Famix-Extensions' }
FamixJavaClass >> structuralChildren [
	^ (OrderedCollection withAll: self methods), self attributes
]
