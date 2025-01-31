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
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `enumValues` | `FamixTWithEnumValues` | `parentEnum` | `FamixTEnumValue` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|
| `incomingTypings` | `FamixTType` | `declaredType` | `FamixTEntityTyping` | Relations to the entities that have this as type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

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
