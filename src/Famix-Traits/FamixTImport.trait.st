"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `importingEntity` | `FamixTImport` | `imports` | `FamixTWithImports` | Importing entity|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `importedEntity` | `FamixTImport` | `incomingImports` | `FamixTImportable` | Imported entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Trait {
	#name : #FamixTImport,
	#instVars : [
		'#importedEntity => FMOne type: #FamixTImportable opposite: #incomingImports',
		'#importingEntity => FMOne type: #FamixTWithImports opposite: #imports'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Import'
}

{ #category : #meta }
FamixTImport classSide >> annotation [

	<FMClass: #TImport super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTImport >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTImport: self
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
	"Relation named: #importingEntity type: #FamixTWithImports opposite: #imports"

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
