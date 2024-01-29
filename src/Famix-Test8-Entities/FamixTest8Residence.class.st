"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `resident` | `FamixTest8Residence` | `outgoingResidences` | `FamixTest8TResident` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `biotope` | `FamixTest8Residence` | `incomingResidences` | `FamixTest8TBiotope` | |

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
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Class {
	#name : #FamixTest8Residence,
	#superclass : #FamixTest8Entity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#resident => FMOne type: #FamixTest8TResident opposite: #outgoingResidences',
		'#biotope => FMOne type: #FamixTest8TBiotope opposite: #incomingResidences'
	],
	#category : #'Famix-Test8-Entities-Entities'
}

{ #category : #meta }
FamixTest8Residence class >> annotation [

	<FMClass: #Residence super: #FamixTest8Entity>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTest8Residence >> biotope [
	"Relation named: #biotope type: #FamixTest8TBiotope opposite: #incomingResidences"

	<generated>
	<target>
	^ biotope
]

{ #category : #accessing }
FamixTest8Residence >> biotope: anObject [

	<generated>
	biotope := anObject
]

{ #category : #accessing }
FamixTest8Residence >> resident [
	"Relation named: #resident type: #FamixTest8TResident opposite: #outgoingResidences"

	<generated>
	<source>
	^ resident
]

{ #category : #accessing }
FamixTest8Residence >> resident: anObject [

	<generated>
	resident := anObject
]
