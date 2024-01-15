"
FamixTStructuralEntity is the abstract superclass for basic data structure in the source code. A structural entity has a declaredType that points to the type of the variable.

## Relations
======================

### Incomming dependencies
- Relation: #incomingAccesses Type: #FamixTAccess Opposite: #variable Comment: All Famix accesses pointing to this structural entity
### Other
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Trait {
	#name : #FamixTStructuralEntity,
	#traits : 'FamixTAccessible + FamixTNamedEntity + FamixTSourceEntity + FamixTTypedEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTAccessible classTrait + FamixTNamedEntity classTrait + FamixTSourceEntity classTrait + FamixTTypedEntity classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTStructuralEntity classSide >> annotation [

	<FMClass: #TStructuralEntity super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #testing }
FamixTStructuralEntity >> isStructuralEntity [

	<generated>
	^ true
]
