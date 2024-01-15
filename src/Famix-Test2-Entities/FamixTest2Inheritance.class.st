"
## Relations
======================

### Association source
- Relation: #subclass Type: #FamixTWithInheritances Opposite: #superInheritances Comment: Subclass linked to in this relationship. from-side of the association
### Association target
- Relation: #superclass Type: #FamixTWithInheritances Opposite: #subInheritances Comment: Superclass linked to in this relationship. to-side of the association
### Other
- Relation: #next Type: #FamixTAssociation Opposite: #previous Comment: Next association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #previous Type: #FamixTAssociation Opposite: #next Comment: Previous association in an ordered collection of associations. Currently not supported by the Moose importer

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

"
Class {
	#name : #FamixTest2Inheritance,
	#superclass : #FamixTest2Entity,
	#traits : 'FamixTInheritance',
	#classTraits : 'FamixTInheritance classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Inheritance class >> annotation [

	<FMClass: #Inheritance super: #FamixTest2Entity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^ self
]
