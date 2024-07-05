"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `infectable` | `FamixTest8Infection` | `outgoingInfections` | `FamixTest8TInfectable` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `infectious` | `FamixTest8Infection` | `incomingInfections` | `FamixTest8TInfectious` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isInvasive` | `Boolean` | false | |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Class {
	#name : #FamixTest8Infection,
	#superclass : #FamixTest8Entity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#infectable => FMOne type: #FamixTest8TInfectable opposite: #outgoingInfections',
		'#infectious => FMOne type: #FamixTest8TInfectious opposite: #incomingInfections',
		'#isInvasive => FMProperty defaultValue: false'
	],
	#category : #'Famix-Test8-Entities-Entities'
}

{ #category : #meta }
FamixTest8Infection class >> annotation [

	<FMClass: #Infection super: #FamixTest8Entity>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTest8Infection >> infectable [
	"Relation named: #infectable type: #FamixTest8TInfectable opposite: #outgoingInfections"

	<generated>
	<source>
	^ infectable
]

{ #category : #accessing }
FamixTest8Infection >> infectable: anObject [

	<generated>
	infectable := anObject
]

{ #category : #accessing }
FamixTest8Infection >> infectious [
	"Relation named: #infectious type: #FamixTest8TInfectious opposite: #incomingInfections"

	<generated>
	<target>
	^ infectious
]

{ #category : #accessing }
FamixTest8Infection >> infectious: anObject [

	<generated>
	infectious := anObject
]

{ #category : #accessing }
FamixTest8Infection >> isInvasive [

	<FMProperty: #isInvasive type: #Boolean defaultValue: false>
	<generated>
	^ isInvasive ifNil: [ isInvasive := false ]
]

{ #category : #accessing }
FamixTest8Infection >> isInvasive: anObject [
	<generated>
	isInvasive := anObject
]
