"
## Relations
======================

### Association source
| Relation | Type | Opposite | Comment |
| `accessor` | `FamixTWithAccesses` | `accesses` | Behavioural entity making the access to the variable. from-side of the association|

### Association target
| Relation | Type | Opposite | Comment |
| `variable` | `FamixTAccessible` | `incomingAccesses` | Variable accessed. to-side of the association|

### Other
| Relation | Type | Opposite | Comment |
| `next` | `FamixTAssociation` | `previous` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `isWrite` | Boolean | Write access|

"
Class {
	#name : #FamixStAccess,
	#superclass : #FamixStEntity,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAccess class >> annotation [

	<FMClass: #Access super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]
