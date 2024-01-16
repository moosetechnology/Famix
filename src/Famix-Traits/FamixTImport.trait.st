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
