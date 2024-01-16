"
FamixTStructuralEntity is the abstract superclass for basic data structure in the source code. A structural entity has a declaredType that points to the type of the variable.

## Relations
======================

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingAccesses` | `FamixTAccess` | `variable` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Type | Opposite | Comment |
| `declaredType` | `FamixTType` | `typedEntities` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|

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
