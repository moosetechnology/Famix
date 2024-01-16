"
## Relations
======================

### Parents
- Relation: #typeContainer Type: #FamixTWithTypes Opposite: #types Comment: Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).
### Children
- Relation: #attributes Type: #FamixTAttribute Opposite: #parentType Comment: List of attributes declared by this type.
- Relation: #methods Type: #FamixTMethod Opposite: #parentType Comment: Methods declared by this type.
- Relation: #types Type: #FamixTType Opposite: #typeContainer Comment: Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.
### Outgoing dependencies
- Relation: #interfaceImplementations Type: #FamixTImplementation Opposite: #implementingClass Comment: Implementation relationships
- Relation: #superInheritances Type: #FamixTInheritance Opposite: #subclass Comment: Superinheritance relationships, i.e. known superclasses of this type.
### Incoming dependencies
- Relation: #incomingReferences Type: #FamixTReference Opposite: #referredType Comment: References to this entity by other entities.
- Relation: #subInheritances Type: #FamixTInheritance Opposite: #superclass Comment: Subinheritance relationships, i.e. known subclasses of this type.
### Other
- Relation: #annotationInstances Type: #FamixTAnnotationInstance Opposite: #annotatedEntity Comment: This property corresponds to the set of annotations associated to the entity
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
- Named: #visibility Type: String Comment: Visibility of the entity

"
Class {
	#name : #FamixJavaException,
	#superclass : #FamixJavaClass,
	#traits : 'FamixTCanImplement + FamixTException + FamixTHasVisibility + FamixTWithAnnotationInstances + FamixTWithTypes',
	#classTraits : 'FamixTCanImplement classTrait + FamixTException classTrait + FamixTHasVisibility classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaException class >> annotation [

	<FMClass: #Exception super: #FamixJavaClass>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
