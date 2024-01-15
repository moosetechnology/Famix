"
## Relations
======================

### Association source
- Relation: #implementingClass Type: #FamixTCanImplement Opposite: #interfaceImplementations Comment: Class linked to in this relationship. from-side of the association
### Association target
- Relation: #interface Type: #FamixTImplementable Opposite: #implementations Comment: Interface linked to in this relationship. to-side of the association
### Other
- Relation: #next Type: #FamixTAssociation Opposite: #previous Comment: Next association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #previous Type: #FamixTAssociation Opposite: #next Comment: Previous association in an ordered collection of associations. Currently not supported by the Moose importer

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

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
