"
## Relations
======================

### Association source
| Relation | Type | Opposite | Comment |
| `importingEntity` | `FamixTWithImports` | `outgoingImports` | Importing entity|

### Association target
| Relation | Type | Opposite | Comment |
| `importedEntity` | `FamixTImportable` | `incomingImports` | Imported entity|

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
