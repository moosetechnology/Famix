"
## Relations
======================

### Association source
- Relation: #importingEntity Type: #FamixTWithImports Opposite: #outgoingImports Comment: Importing entity
### Association target
- Relation: #importedEntity Type: #FamixTImportable Opposite: #incomingImports Comment: Imported entity
### Other
- Relation: #previous Type: #FamixTAssociation Opposite: #next Comment: Previous association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #next Type: #FamixTAssociation Opposite: #previous Comment: Next association in an ordered collection of associations. Currently not supported by the Moose importer

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

"
Trait {
	#name : #FamixTImport,
	#instVars : [
		'#importingEntity => FMOne type: #FamixTWithImports opposite: #outgoingImports',
		'#importedEntity => FMOne type: #FamixTImportable opposite: #incomingImports'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTImport classSide >> annotation [

	<FMClass: #TImport super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTImport >> importedEntity [
	"Relation named: #importedEntity type: #FamixTImportable opposite: #incomingImports"

	<generated>
	<FMComment: 'Imported entity'>
	<target>
	^ importedEntity
]

{ #category : #accessing }
FamixTImport >> importedEntity: anObject [

	<generated>
	importedEntity := anObject
]

{ #category : #accessing }
FamixTImport >> importingEntity [
	"Relation named: #importingEntity type: #FamixTWithImports opposite: #outgoingImports"

	<generated>
	<FMComment: 'Importing entity'>
	<source>
	^ importingEntity
]

{ #category : #accessing }
FamixTImport >> importingEntity: anObject [

	<generated>
	importingEntity := anObject
]
