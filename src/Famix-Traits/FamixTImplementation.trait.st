"
## Relations
======================

### Association source
- Relation: #implementingClass Type: #FamixTCanImplement Opposite: #interfaceImplementations Comment: Class linked to in this relationship. from-side of the association
### Association target
- Relation: #interface Type: #FamixTImplementable Opposite: #implementations Comment: Interface linked to in this relationship. to-side of the association
### Other
- Relation: #next Type: #FamixTAssociation Opposite: #previous Comment: Next association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #previous Type: #FamixTAssociation Opposite: #next Comment: Previous association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

"
Trait {
	#name : #FamixTImplementation,
	#instVars : [
		'#implementingClass => FMOne type: #FamixTCanImplement opposite: #interfaceImplementations',
		'#interface => FMOne type: #FamixTImplementable opposite: #implementations'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTImplementation classSide >> annotation [

	<FMClass: #TImplementation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTImplementation >> implementingClass [
	"Relation named: #implementingClass type: #FamixTCanImplement opposite: #interfaceImplementations"

	<generated>
	<FMComment: 'Class linked to in this relationship. from-side of the association'>
	<source>
	^ implementingClass
]

{ #category : #accessing }
FamixTImplementation >> implementingClass: anObject [

	<generated>
	implementingClass := anObject
]

{ #category : #accessing }
FamixTImplementation >> interface [
	"Relation named: #interface type: #FamixTImplementable opposite: #implementations"

	<generated>
	<FMComment: 'Interface linked to in this relationship. to-side of the association'>
	<target>
	^ interface
]

{ #category : #accessing }
FamixTImplementation >> interface: anObject [

	<generated>
	interface := anObject
]
