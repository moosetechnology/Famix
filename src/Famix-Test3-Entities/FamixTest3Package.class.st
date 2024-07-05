"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `childEntities` | `FamixTPackage` | `parentPackage` | `FamixTPackageable` | |

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
Class {
	#name : #FamixTest3Package,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTPackage',
	#classTraits : 'FamixTPackage classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Package class >> annotation [

	<FMClass: #Package super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]
