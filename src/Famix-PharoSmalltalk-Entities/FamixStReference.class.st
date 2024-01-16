"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
| `referencer` | `FamixTReference` | `outgoingReferences` | `FamixTWithReferences` | Source entity making the reference. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
| `referredType` | `FamixTReference` | `incomingReferences` | `FamixTReferenceable` | Target entity referenced. to-side of the association|

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
	#name : #FamixStReference,
	#superclass : #FamixStEntity,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStReference class >> annotation [

	<FMClass: #Reference super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]
