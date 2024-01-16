"
## Relations
======================

### Association source
| Relation | Type | Opposite | Comment |
| `implementingClass` | `FamixTCanImplement` | `interfaceImplementations` | Class linked to in this relationship. from-side of the association|

### Association target
| Relation | Type | Opposite | Comment |
| `interface` | `FamixTImplementable` | `implementations` | Interface linked to in this relationship. to-side of the association|

### Other
| Relation | Type | Opposite | Comment |
| `next` | `FamixTAssociation` | `previous` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Class {
	#name : #FamixJavaImplementation,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTImplementation',
	#classTraits : 'FamixTImplementation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaImplementation class >> annotation [

	<FMClass: #Implementation super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
