"
FamixTStructuralEntity is the abstract superclass for basic data structure in the source code. A structural entity has a declaredType that points to the type of the variable.

## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `candidates` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTStructuralEntity,
	#traits : 'FamixTAccessible + FamixTCanBeStub + FamixTNamedEntity + FamixTTypedEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTAccessible classTrait + FamixTCanBeStub classTrait + FamixTNamedEntity classTrait + FamixTTypedEntity classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-StructuralEntity'
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
