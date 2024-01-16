"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
| `subclass` | `FamixTInheritance` | `superInheritances` | `FamixTWithInheritances` | Subclass linked to in this relationship. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
| `superclass` | `FamixTInheritance` | `subInheritances` | `FamixTWithInheritances` | Superclass linked to in this relationship. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

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
