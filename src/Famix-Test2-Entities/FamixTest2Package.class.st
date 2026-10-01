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
	#name : 'FamixTest2Package',
	#superclass : 'FamixTest2Entity',
	#traits : 'FamixTPackage',
	#classTraits : 'FamixTPackage classTrait',
	#category : 'Famix-Test2-Entities-Entities',
	#package : 'Famix-Test2-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest2Package class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Package super: #FamixTest2Entity>
	<package: #'Famix-Test2-Entities'>
	<generated>
]
