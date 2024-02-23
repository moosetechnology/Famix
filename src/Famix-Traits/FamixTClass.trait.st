"
FamixTClass represents an entity which can build new instances. A FamixTClass is a FamixTType, therefore it is involved in super/sub types relationships (depending on the language) and it holds attributes, methods.

FamixT does not model explicitly interfaces, but a FamixTClass can represent a Java interface by setting the isInterface property.

A class is typically scoped in a namespace. To model nested or anonymous classes, extractors can set the container of classes to classes or methods, respectively.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|
| `methods` | `FamixTWithMethods` | `parentType` | `FamixTMethod` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `superInheritances` | `FamixTWithInheritances` | `subclass` | `FamixTInheritance` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredType` | `FamixTReference` | References to this entity by other entities.|
| `subInheritances` | `FamixTWithInheritances` | `superclass` | `FamixTInheritance` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `typedEntities` | `FamixTType` | `declaredType` | `FamixTTypedEntity` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTClass,
	#traits : 'FamixTInvocationsReceiver + (FamixTType - {#queryStaticIncomingAssociations. #queryStaticOutgoingAssociations}) + FamixTWithAttributes + FamixTWithComments + FamixTWithInheritances + FamixTWithMethods',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTType classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithInheritances classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Traits-Class'
}

{ #category : #meta }
FamixTClass classSide >> annotation [

	<FMClass: #TClass super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTClass classSide >> annotationFamixClassGroup [
	<generated>
	<mooseGroup>
	^ FamixClassGroup
]

{ #category : #adding }
FamixTClass >> addFirstMethodsOverriding: aMethod in: aCollection [

	self directSubclasses do: [ :subClass |
		subClass methods
			detect: [ :method | method signature = aMethod signature ]
			ifFound: [ :overridingMethod | aCollection add: overridingMethod ]
			ifNone: [ subClass addMethodOverriding: aMethod in: aCollection ] ]
]

{ #category : #private }
FamixTClass >> addMethodOverriding: aMethod in: aCollection [

	self directSubclasses do: [ :subClass |
		subClass methods
			detect: [ :method |   method signature = aMethod signature ]
			ifFound: [ :overridingMethod | aCollection add: overridingMethod ].
			subClass addMethodOverriding: aMethod in: aCollection  ]
]

{ #category : #metrics }
FamixTClass >> addedMethods [
	| allHierarchyMethodSignatures |
	allHierarchyMethodSignatures := self allHierarchyMethods collect: #signature.
	^ self methods reject: [ :each | allHierarchyMethodSignatures includes: each signature ]
]

{ #category : #enumerating }
FamixTClass >> allHierarchyMethods [

	| allHierarchyMethods |
	allHierarchyMethods := OrderedCollection new.
	self allSuperclassesDo: [ :each | 
	allHierarchyMethods addAll: each methods ] .
	^ allHierarchyMethods
]

{ #category : #enumerating }
FamixTClass >> allMethods [

	^ self methods , self inheritedMethods 
]

{ #category : #enumerating }
FamixTClass >> inheritedAttributes [

	| inheritedAttrs |
	inheritedAttrs := OrderedCollection new.
	self allSuperclassesDo: [ :each |
		inheritedAttrs addAll: (each isParametricEntity
				 ifTrue: [ each genericEntity ]
				 ifFalse: [ each ]) attributes ].
	^ inheritedAttrs
]

{ #category : #enumerating }
FamixTClass >> inheritedMethods [

	| inheritedMethods |
	inheritedMethods := OrderedCollection new.

	self allSuperclassesDo: [ :each | 
		| workingMethods |
		workingMethods := self methods , inheritedMethods.
		each methods do: [ :m | 
			(workingMethods allSatisfy: [ :m2 | m signature ~= m2 signature ]) 
				ifTrue: [ inheritedMethods add: m ] ] ].
	^ inheritedMethods
]

{ #category : #enumerating }
FamixTClass >> inheritedSignatures [

	| inheritedSignatures |
	inheritedSignatures := Set new.
	self superclassHierarchy do: [ :each | 
		inheritedSignatures addAll:
			(each methods collect: [ :method | method signature ]) ].
	^ inheritedSignatures
]

{ #category : #enumerating }
FamixTClass >> inheritedSignaturesToMethod [

	| inheritedSignaturesToMethod |
	inheritedSignaturesToMethod := Dictionary new.
	self allSuperclassesDo: [ :each | 
		each methods do: [ :method | 
			inheritedSignaturesToMethod
				at: method signature
				ifAbsentPut: [ method ] ] ].
	^ inheritedSignaturesToMethod
]

{ #category : #testing }
FamixTClass >> isClass [

	<generated>
	^ true
]

{ #category : #testing }
FamixTClass >> isObjectClass [

	^ self name = 'Object'
]

{ #category : #testing }
FamixTClass >> isTestCase [
	<FMProperty: #isTestCase type: #Boolean>
	<FMComment: 'True if the method is considered as a test'>
	<derived>
	^ self attributeAt: #isTestCase ifAbsent: [ false ]
]

{ #category : #testing }
FamixTClass >> isTestCase: aBoolean [
	^ self attributeAt: #isTestCase put: true
]

{ #category : #enumerating }
FamixTClass >> overriddenMethods [

	^ self methods select: [ :m | self allHierarchyMethods anySatisfy: [ :superMethod | superMethod signature = m signature ] ].
]

{ #category : #metrics }
FamixTClass >> weightOfAClass [
	<FMProperty: #weightOfAClass type: #Number>
	<derived>
	<FMComment: 'Weight of a class'>	
			
	^self
		lookUpPropertyNamed: #weightOfAClass
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FamixTClass >> weightOfAClass: aNumber [
	self cacheAt: #weightOfAClass put: aNumber
]
