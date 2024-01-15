"
This is the abstract representation of an Exception. It is specific to Java. It points to an exceptionClass. The class of a FamixTException is a normal FamixTClass.

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
- Relation: #catchingEntities Type: #FamixTWithExceptions Opposite: #caughtExceptions
- Relation: #comments Type: #FamixTComment Opposite: #commentedEntity Comment: List of comments for the entity
- Relation: #declaringEntities Type: #FamixTWithExceptions Opposite: #declaredExceptions
- Relation: #receivingInvocations Type: #FamixTInvocation Opposite: #receiver Comment: List of invocations performed on this entity (considered as the receiver)
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #throwingEntities Type: #FamixTWithExceptions Opposite: #thrownExceptions
- Relation: #typedEntities Type: #FamixTTypedEntity Opposite: #declaredType Comment: Entities that have this type as declaredType

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Trait {
	#name : #FamixTException,
	#instVars : [
		'#catchingEntities => FMMany type: #FamixTWithExceptions opposite: #caughtExceptions',
		'#declaringEntities => FMMany type: #FamixTWithExceptions opposite: #declaredExceptions',
		'#throwingEntities => FMMany type: #FamixTWithExceptions opposite: #thrownExceptions'
	],
	#traits : 'FamixTClass',
	#classTraits : 'FamixTClass classTrait',
	#category : #'Famix-Traits-Exception'
}

{ #category : #meta }
FamixTException classSide >> annotation [

	<FMClass: #TException super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTException >> addCatchingEntity: anObject [
	<generated>
	^ self catchingEntities add: anObject
]

{ #category : #adding }
FamixTException >> addDeclaringEntity: anObject [
	<generated>
	^ self declaringEntities add: anObject
]

{ #category : #adding }
FamixTException >> addThrowingEntity: anObject [
	<generated>
	^ self throwingEntities add: anObject
]

{ #category : #accessing }
FamixTException >> catchingEntities [
	"Relation named: #catchingEntities type: #FamixTWithExceptions opposite: #caughtExceptions"

	<generated>
	<derived>
	^ catchingEntities
]

{ #category : #accessing }
FamixTException >> catchingEntities: anObject [

	<generated>
	catchingEntities value: anObject
]

{ #category : #accessing }
FamixTException >> declaringEntities [
	"Relation named: #declaringEntities type: #FamixTWithExceptions opposite: #declaredExceptions"

	<generated>
	<derived>
	^ declaringEntities
]

{ #category : #accessing }
FamixTException >> declaringEntities: anObject [

	<generated>
	declaringEntities value: anObject
]

{ #category : #testing }
FamixTException >> isException [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTException >> throwingEntities [
	"Relation named: #throwingEntities type: #FamixTWithExceptions opposite: #thrownExceptions"

	<generated>
	<derived>
	^ throwingEntities
]

{ #category : #accessing }
FamixTException >> throwingEntities: anObject [

	<generated>
	throwingEntities value: anObject
]
