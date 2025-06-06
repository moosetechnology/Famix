"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `implementingClass` | `FamixTImplementation` | `interfaceImplementations` | `FamixTCanImplement` | Class linked to in this relationship. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `interface` | `FamixTImplementation` | `implementations` | `FamixTImplementable` | Interface linked to in this relationship. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



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

{ #category : #visitor }
FamixJavaImplementation >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaImplementation: self
]
