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
	#name : #FamixStInheritance,
	#superclass : #FamixStEntity,
	#traits : 'FamixTInheritance',
	#classTraits : 'FamixTInheritance classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStInheritance class >> annotation [

	<FMClass: #Inheritance super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]
