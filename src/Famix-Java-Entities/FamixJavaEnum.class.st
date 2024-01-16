"
## Relations
======================

### Parents
- Relation: #typeContainer Type: #FamixTWithTypes Opposite: #types Comment: Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).
### Children
- Relation: #attributes Type: #FamixTAttribute Opposite: #parentType Comment: List of attributes declared by this type.
- Relation: #enumValues Type: #FamixTEnumValue Opposite: #parentEnum
- Relation: #methods Type: #FamixTMethod Opposite: #parentType Comment: Methods declared by this type.
### Outgoing dependencies
- Relation: #outgoingImports Type: #FamixTImport Opposite: #importingEntity
- Relation: #superInheritances Type: #FamixTInheritance Opposite: #subclass Comment: Superinheritance relationships, i.e. known superclasses of this type.
### Incoming dependencies
- Relation: #incomingImports Type: #FamixTImport Opposite: #importedEntity Comment: List of imports of this entity
- Relation: #incomingReferences Type: #FamixTReference Opposite: #referredType Comment: References to this entity by other entities.
- Relation: #subInheritances Type: #FamixTInheritance Opposite: #superclass Comment: Subinheritance relationships, i.e. known subclasses of this type.
### Other
- Relation: #comments Type: #FamixTComment Opposite: #commentedEntity Comment: List of comments for the entity
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #typedEntities Type: #FamixTTypedEntity Opposite: #declaredType Comment: Entities that have this type as declaredType

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.
- Named: #visibility Type: String Comment: Visibility of the entity

"
Class {
	#name : #FamixJavaEnum,
	#superclass : #FamixJavaType,
	#traits : 'FamixTEnum + FamixTHasVisibility + FamixTImportable + FamixTWithAttributes + FamixTWithComments + FamixTWithImports + FamixTWithInheritances + FamixTWithMethods',
	#classTraits : 'FamixTEnum classTrait + FamixTHasVisibility classTrait + FamixTImportable classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithImports classTrait + FamixTWithInheritances classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnum class >> annotation [

	<FMClass: #Enum super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixJavaEnum >> values [
	^ self enumValues
]

{ #category : #accessing }
FamixJavaEnum >> values: anObject [
	self enumValues: anObject
]
