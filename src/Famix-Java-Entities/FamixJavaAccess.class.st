"
## Relations
======================

### Association source
- Relation: #accessor Type: #FamixTWithAccesses Opposite: #accesses Comment: Behavioural entity making the access to the variable. from-side of the association
### Association target
- Relation: #variable Type: #FamixTAccessible Opposite: #incomingAccesses Comment: Variable accessed. to-side of the association
### Other
- Relation: #next Type: #FamixTAssociation Opposite: #previous Comment: Next association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #previous Type: #FamixTAssociation Opposite: #next Comment: Previous association in an ordered collection of associations. Currently not supported by the Moose importer

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #isWrite Type: Boolean Comment: Write access

"
Class {
	#name : #FamixJavaAccess,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTAccess',
	#classTraits : 'FamixTAccess classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAccess class >> annotation [

	<FMClass: #Access super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
