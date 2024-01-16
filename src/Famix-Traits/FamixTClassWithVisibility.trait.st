"
## Relations
======================

### Parents
- Relation: #typeContainer Type: #FamixTWithTypes Opposite: #types Comment: Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).
### Children
- Relation: #attributes Type: #FamixTAttribute Opposite: #parentType Comment: List of attributes declared by this type.
- Relation: #methods Type: #FamixTMethod Opposite: #parentType Comment: Methods declared by this type.
### Outgoing dependencies
- Relation: #superInheritances Type: #FamixTInheritance Opposite: #subclass Comment: Superinheritance relationships, i.e. known superclasses of this type.
### Incoming dependencies
- Relation: #incomingReferences Type: #FamixTReference Opposite: #referredType Comment: References to this entity by other entities.
- Relation: #subInheritances Type: #FamixTInheritance Opposite: #superclass Comment: Subinheritance relationships, i.e. known subclasses of this type.
### Other
- Relation: #comments Type: #FamixTComment Opposite: #commentedEntity Comment: List of comments for the entity
- Relation: #receivingInvocations Type: #FamixTInvocation Opposite: #receiver Comment: List of invocations performed on this entity (considered as the receiver)
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #typedEntities Type: #FamixTTypedEntity Opposite: #declaredType Comment: Entities that have this type as declaredType

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.
- Named: #visibility Type: String Comment: Visibility of the entity

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
