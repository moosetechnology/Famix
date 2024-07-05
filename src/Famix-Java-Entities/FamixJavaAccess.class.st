"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accessor` | `FamixTAccess` | `accesses` | `FamixTWithAccesses` | Behavioural entity making the access to the variable. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variable` | `FamixTAccess` | `incomingAccesses` | `FamixTAccessible` | Variable accessed. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `isWrite` | `Boolean` | false | Write access|

"
Class {
	#name : #FamixJavaAccess,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAccess class >> annotation [

	<FMClass: #Access super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
