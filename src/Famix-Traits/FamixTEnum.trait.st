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
| Relation | Type | Opposite | Comment |
| `typeContainer` | `FamixTWithTypes` | `types` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Type | Opposite | Comment |
| `enumValues` | `FamixTEnumValue` | `parentEnum` | |

### Incoming dependencies
| Relation | Type | Opposite | Comment |
| `incomingReferences` | `FamixTReference` | `referredType` | References to this entity by other entities.|

### Other
| Relation | Type | Opposite | Comment |
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|
| `typedEntities` | `FamixTTypedEntity` | `declaredType` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | String | Basic name of the entity, not full reference.|

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
