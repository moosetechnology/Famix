"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `source` | `FamixTFileInclude` | `outgoingIncludeRelations` | `FamixTWithFileIncludes` | The file that is including|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `target` | `FamixTFileInclude` | `incomingIncludeRelations` | `FamixTWithFileIncludes` | The file that is included|



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

{ #category : #visitor }
FamixTFileInclude >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTFileInclude: self
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
