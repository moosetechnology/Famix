"
## Relations
======================

### Association source
- Relation: #importingEntity Type: #FamixTWithImports Opposite: #outgoingImports Comment: Importing entity
### Association target
- Relation: #importedEntity Type: #FamixTImportable Opposite: #incomingImports Comment: Imported entity
### Other
- Relation: #next Type: #FamixTAssociation Opposite: #previous Comment: Next association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #previous Type: #FamixTAssociation Opposite: #next Comment: Previous association in an ordered collection of associations. Currently not supported by the Moose importer

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

"
Class {
	#name : #FamixJavaImport,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTImport',
	#classTraits : 'FamixTImport classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaImport class >> annotation [

	<FMClass: #Import super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
