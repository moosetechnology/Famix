"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `implementingClass` | `FamixTImplementation` | `interfaceImplementations` | `FamixTCanImplement` | Class linked to in this relationship. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `interface` | `FamixTImplementation` | `implementations` | `FamixTImplementable` | Interface linked to in this relationship. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Trait {
	#name : 'FamixTImplementation',
	#instVars : [
		'#implementingClass => FMOne type: #FamixTCanImplement opposite: #interfaceImplementations',
		'#interface => FMOne type: #FamixTImplementable opposite: #implementations'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : 'Famix-Traits-Implementation',
	#package : 'Famix-Traits',
	#tag : 'Implementation'
}

{ #category : 'meta' }
FamixTImplementation classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TImplementation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTImplementation >> implementingClass [
	"Relation named: #implementingClass type: #FamixTCanImplement opposite: #interfaceImplementations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Class linked to in this relationship. from-side of the association'>
	<source>
	^ implementingClass
]

{ #category : 'accessing' }
FamixTImplementation >> implementingClass: anObject [

	<ignoreForCoverage>
	<generated>
	implementingClass := anObject
]

{ #category : 'accessing' }
FamixTImplementation >> interface [
	"Relation named: #interface type: #FamixTImplementable opposite: #implementations"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Interface linked to in this relationship. to-side of the association'>
	<target>
	^ interface
]

{ #category : 'accessing' }
FamixTImplementation >> interface: anObject [

	<ignoreForCoverage>
	<generated>
	interface := anObject
]
