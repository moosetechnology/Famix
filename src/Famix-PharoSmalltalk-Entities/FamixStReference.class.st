"
## Relations
======================

### Association source
- Relation: #referencer Type: #FamixTWithReferences Opposite: #outgoingReferences Comment: Source entity making the reference. from-side of the association
### Association target
- Relation: #referredType Type: #FamixTReferenceable Opposite: #incomingReferences Comment: Target entity referenced. to-side of the association
### Other
- Relation: #next Type: #FamixTAssociation Opposite: #previous Comment: Next association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #previous Type: #FamixTAssociation Opposite: #next Comment: Previous association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

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
