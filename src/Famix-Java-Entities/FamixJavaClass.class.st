"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentPackage` | `FamixTPackageable` | `childEntities` | `FamixTPackage` | Package containing the entity in the code structure (if applicable)|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `methods` | `FamixTWithMethods` | `parentType` | `FamixTMethod` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `interfaceImplementations` | `FamixTCanImplement` | `implementingClass` | `FamixTImplementation` | Implementation relationships|
| `outgoingConcretizations` | `FamixTConcreteType` | `concreteParameter` | `FamixTConcretization` | Concretizations where this type is the concrete parameter.|
| `outgoingImports` | `FamixTWithImports` | `importingEntity` | `FamixTImport` | |
| `superInheritances` | `FamixTWithInheritances` | `subclass` | `FamixTInheritance` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingDeclarations` | `FamixTType` | `declaredType` | `FamixTTypeDeclaration` | Relations to the entities that have this as type.|
| `incomingImports` | `FamixTImportable` | `importedEntity` | `FamixTImport` | List of imports of this entity|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|
| `subInheritances` | `FamixTWithInheritances` | `superclass` | `FamixTInheritance` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericEntities` | `FamixTConcreteType` | `parameters` | `FamixTParametricEntity` | Generic entities that have this type as type parameter.|
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isAbstract` | `Boolean` | false | Entity can be declared abstract|
| `isClassSide` | `Boolean` | false | Entity can be declared class side i.e. static|
| `isFinal` | `Boolean` | false | Entity can be declared final|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|
| `visibility` | `String` | nil | Visibility of the entity|

"
Class {
	#name : #FamixJavaClass,
	#superclass : #FamixJavaType,
	#traits : 'FamixJavaTClassMetrics + FamixTCanBeAbstract + FamixTCanBeClassSide + FamixTCanBeFinal + FamixTCanImplement + FamixTClass + FamixTClassMetrics + FamixTConcreteType + FamixTHasVisibility + FamixTImportable + FamixTLCOMMetrics + FamixTPackageable + FamixTWithImports',
	#classTraits : 'FamixJavaTClassMetrics classTrait + FamixTCanBeAbstract classTrait + FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTCanImplement classTrait + FamixTClass classTrait + FamixTClassMetrics classTrait + FamixTConcreteType classTrait + FamixTHasVisibility classTrait + FamixTImportable classTrait + FamixTLCOMMetrics classTrait + FamixTPackageable classTrait + FamixTWithImports classTrait',
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
FamixJavaClass >> inheritsFromTestCase [
	"In the past we checked for the one from junit, but Apache also have its own way to test with a superclass named TestCase."

	^ self superclassHierarchy anySatisfy: [ :each | each name = #TestCase ]
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

{ #category : #testing }
FamixJavaClass >> isJUnit4TestCase [

	<FMProperty: #isJUnit4TestCase type: #Boolean>
	<derived>
	<FMComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self methods anySatisfy: [ :m | m isJUnit4Test ]
]

{ #category : #testing }
FamixJavaClass >> isTestCase [

	<FMProperty: #isTestCase type: #Boolean>
	<derived>
	<FMComment: 'True if the method is considered as a Java test'>
	^ self inheritsFromTestCase or: [ self isJUnit4TestCase ]
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

{ #category : #printing }
FamixJavaClass >> mooseNameOn: aStream [

	self typeContainer ifNotNil: [ :parent |
		parent mooseNameOn: aStream.
		self isInnerClass
			ifTrue: [ aStream nextPut: $$ ]
			ifFalse: [ aStream nextPutAll: '::' ] ].
	self name ifNotNil: [ :n | aStream nextPutAll: n ]
]

{ #category : #'Famix-Extensions' }
FamixJavaClass >> structuralChildren [
	^ (OrderedCollection withAll: self methods), self attributes
]
