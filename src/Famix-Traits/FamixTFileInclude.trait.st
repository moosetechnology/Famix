"
## Relations
======================

### Other
| Relation | Type | Opposite | Comment |
| `next` | `FamixTAssociation` | `previous` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `source` | `FamixTWithFileIncludes` | `outgoingIncludeRelations` | The file that is including|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|
| `target` | `FamixTWithFileIncludes` | `incomingIncludeRelations` | The file that is included|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Trait {
	#name : #FamixTFileInclude,
	#instVars : [
		'#source => FMOne type: #FamixTWithFileIncludes opposite: #outgoingIncludeRelations',
		'#target => FMOne type: #FamixTWithFileIncludes opposite: #incomingIncludeRelations'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-FileInclude'
}

{ #category : #meta }
FamixTFileInclude classSide >> annotation [

	<FMClass: #TFileInclude super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTFileInclude >> source [
	"Relation named: #source type: #FamixTWithFileIncludes opposite: #outgoingIncludeRelations"

	<generated>
	<FMComment: 'The file that is including'>
	^ source
]

{ #category : #accessing }
FamixTFileInclude >> source: anObject [

	<generated>
	source := anObject
]

{ #category : #accessing }
FamixTFileInclude >> target [
	"Relation named: #target type: #FamixTWithFileIncludes opposite: #incomingIncludeRelations"

	<generated>
	<FMComment: 'The file that is included'>
	^ target
]

{ #category : #accessing }
FamixTFileInclude >> target: anObject [

	<generated>
	target := anObject
]
