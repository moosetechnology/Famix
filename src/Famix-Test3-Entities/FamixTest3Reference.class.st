"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `referencer` | `FamixTReference` | `outgoingReferences` | `FamixTWithReferences` | Source entity making the reference. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `referredEntity` | `FamixTReference` | `incomingReferences` | `FamixTReferenceable` | Target entity referenced. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : #FamixTest3Reference,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Reference class >> annotation [

	<FMClass: #Reference super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]
