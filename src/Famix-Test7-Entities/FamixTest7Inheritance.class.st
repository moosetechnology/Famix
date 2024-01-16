"
## Relations
======================

### Association source
| Relation | Type | Opposite | Comment |
| `subclass` | `FamixTWithInheritances` | `superInheritances` | Subclass linked to in this relationship. from-side of the association|

### Association target
| Relation | Type | Opposite | Comment |
| `superclass` | `FamixTWithInheritances` | `subInheritances` | Superclass linked to in this relationship. to-side of the association|

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
	#name : #FamixTest7Inheritance,
	#superclass : #FamixTest7Entity,
	#traits : 'FamixTInheritance',
	#classTraits : 'FamixTInheritance classTrait',
	#category : #'Famix-Test7-Entities-Entities'
}

{ #category : #meta }
FamixTest7Inheritance class >> annotation [

	<FMClass: #Inheritance super: #FamixTest7Entity>
	<package: #'Famix-Test7-Entities'>
	<generated>
	^ self
]
