"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `typeContainer` | `FamixTWithTypes` | `types` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Type | Opposite | Comment |
| `attributes` | `FamixTAttribute` | `parentType` | List of attributes declared by this type.|
| `methods` | `FamixTMethod` | `parentType` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `superInheritances` | `FamixTInheritance` | `subclass` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Type | Opposite | Comment |
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
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|
| `visibility` | String | Visibility of the entity|

"
Trait {
	#name : #FamixTClassWithVisibility,
	#traits : 'FamixTClass + FamixTHasVisibility',
	#classTraits : 'FamixTClass classTrait + FamixTHasVisibility classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTClassWithVisibility classSide >> annotation [

	<FMClass: #TClassWithVisibility super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #enumerating }
FamixTClassWithVisibility >> inheritedAttributes [

	| inheritedAttrs |
	inheritedAttrs := OrderedCollection new.
	self allSuperclassesDo: [ :each | 
		each attributes do: [ :attr | 
			attr isPrivate ifFalse: [ inheritedAttrs add: attr ] ] ].
	^ inheritedAttrs
]

{ #category : #enumerating }
FamixTClassWithVisibility >> inheritedMethods [

	| inheritedMethods |
	inheritedMethods := OrderedCollection new.
	self allSuperclassesDo: [ :each | 
		each methods do: [ :method | 
			method isPrivate ifFalse: [ inheritedMethods add: method ] ] ].
	^ inheritedMethods
]

{ #category : #enumerating }
FamixTClassWithVisibility >> inheritedSignatures [

	| inheritedSignatures |
	inheritedSignatures := Set new.
	self superclassHierarchy do: [ :each | 
		each methods do: [ :method | 
			method isPrivate ifFalse: [ 
				inheritedSignatures add: method signature ] ] ].
	^ inheritedSignatures
]

{ #category : #enumerating }
FamixTClassWithVisibility >> inheritedSignaturesToMethod [

	| inheritedSignaturesToMethod |
	inheritedSignaturesToMethod := Dictionary new.
	self allSuperclassesDo: [ :each | 
		each methods do: [ :method | 
			method isPrivate ifFalse: [ 
				inheritedSignaturesToMethod
					at: method signature
					ifAbsentPut: [ method ] ] ] ].
	^ inheritedSignaturesToMethod
]
