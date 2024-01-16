"
## Relations
======================

### Association source
| Relation | Type | Opposite | Comment |
| `resident` | `FamixTest8TResident` | `outgoingResidences` | |

### Association target
| Relation | Type | Opposite | Comment |
| `biotope` | `FamixTest8TBiotope` | `incomingResidences` | |

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
