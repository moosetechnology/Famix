"
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
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `methods` | `FamixTWithMethods` | `parentType` | `FamixTMethod` | Methods declared by this type.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `superInheritances` | `FamixTWithInheritances` | `subclass` | `FamixTInheritance` | Superinheritance relationships, i.e. known superclasses of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingDeclarations` | `FamixTType` | `declaredType` | `FamixTTypeDeclaration` | Relations to the entities that have this as type.|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|
| `subInheritances` | `FamixTWithInheritances` | `superclass` | `FamixTInheritance` | Subinheritance relationships, i.e. known subclasses of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|
| `visibility` | `String` | nil | Visibility of the entity|

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
