"
This models an enum.

For example, the following Java code defines an Enum with seven EnumValues.

public enum Day {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY, 
    THURSDAY, FRIDAY, SATURDAY 
}

Instance Variables:
	values	<(MultivalueLink of: FamixTEnumValue)>

## Relations
======================

### Parents
- Relation: #typeContainer Type: #FamixTWithTypes Opposite: #types Comment: Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).
### Children
- Relation: #enumValues Type: #FamixTEnumValue Opposite: #parentEnum
### Incomming dependencies
- Relation: #incomingReferences Type: #FamixTReference Opposite: #referredType Comment: References to this entity by other entities.
### Other
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #typedEntities Type: #FamixTTypedEntity Opposite: #declaredType Comment: Entities that have this type as declaredType

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Trait {
	#name : #FamixTEnum,
	#traits : 'FamixTType + FamixTWithEnumValues',
	#classTraits : 'FamixTType classTrait + FamixTWithEnumValues classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTEnum classSide >> annotation [

	<FMClass: #TEnum super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]
