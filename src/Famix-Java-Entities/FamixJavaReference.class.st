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
	#name : #FamixJavaReference,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaReference class >> annotation [

	<FMClass: #Reference super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #printing }
FamixJavaReference >> mooseNameOn: aStream [
	"aStream nextPutAll: 'Reference'."

	self source ifNotNil: [ aStream nextPutAll: self source name ].
	aStream nextPutAll: ' refers to '.
	self target ifNotNil: [ aStream nextPutAll: self target name ]
]

{ #category : #printing }
FamixJavaReference >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Reference)'
]
