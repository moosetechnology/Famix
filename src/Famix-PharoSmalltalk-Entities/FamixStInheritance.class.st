"
## Relations
======================

### Association source
- Relation: #subclass Type: #FamixTWithInheritances Opposite: #superInheritances Comment: Subclass linked to in this relationship. from-side of the association
### Association target
- Relation: #superclass Type: #FamixTWithInheritances Opposite: #subInheritances Comment: Superclass linked to in this relationship. to-side of the association
### Other
- Relation: #next Type: #FamixTAssociation Opposite: #previous Comment: Next association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #previous Type: #FamixTAssociation Opposite: #next Comment: Previous association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

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
