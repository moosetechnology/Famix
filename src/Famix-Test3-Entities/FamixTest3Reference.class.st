"
## Relations
======================

### Association source
| Relation | Type | Opposite | Comment |
| `referencer` | `FamixTWithReferences` | `outgoingReferences` | Source entity making the reference. from-side of the association|

### Association target
| Relation | Type | Opposite | Comment |
| `referredType` | `FamixTReferenceable` | `incomingReferences` | Target entity referenced. to-side of the association|

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
