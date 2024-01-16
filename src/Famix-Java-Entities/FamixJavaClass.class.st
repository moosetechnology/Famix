"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentPackage` | `FamixTPackage` | `childEntities` | Package containing the entity in the code structure (if applicable)|
| `typeContainer` | `FamixTWithTypes` | `types` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Type | Opposite | Comment |
| `attributes` | `FamixTAttribute` | `parentType` | List of attributes declared by this type.|
| `methods` | `FamixTMethod` | `parentType` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `interfaceImplementations` | `FamixTImplementation` | `implementingClass` | Implementation relationships|
| `outgoingImports` | `FamixTImport` | `importingEntity` | |
| `superInheritances` | `FamixTInheritance` | `subclass` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingImports` | `FamixTImport` | `importedEntity` | List of imports of this entity|
| `incomingReferences` | `FamixTReference` | `referredType` | References to this entity by other entities.|
| `subInheritances` | `FamixTInheritance` | `superclass` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Type | Opposite | Comment |
| `comments` | `FamixTComment` | `commentedEntity` | List of comments for the entity|
| `receivingInvocations` | `FamixTInvocation` | `receiver` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|
| `typedEntities` | `FamixTTypedEntity` | `declaredType` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Comment |
| `isAbstract` | Boolean | Entity can be declared abstract|
| `isClassSide` | Boolean | Entity can be declared class side i.e. static|
| `isFinal` | Boolean | Entity can be declared final|
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|
| `visibility` | String | Visibility of the entity|

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
