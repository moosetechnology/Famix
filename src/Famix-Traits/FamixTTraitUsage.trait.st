"
## Relations
======================

### Association source
| Relation | Type | Opposite | Comment |
| `trait` | `FamixTTrait` | `incomingTraitUsages` | |

### Association target
| Relation | Type | Opposite | Comment |
| `user` | `FamixTTraitUser` | `outgoingTraitUsages` | |

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
	#name : #FamixTTraitUsage,
	#instVars : [
		'#trait => FMOne type: #FamixTTrait opposite: #incomingTraitUsages',
		'#user => FMOne type: #FamixTTraitUser opposite: #outgoingTraitUsages'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Trait'
}

{ #category : #meta }
FamixTTraitUsage classSide >> annotation [

	<FMClass: #TTraitUsage super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTTraitUsage >> trait [
	"Relation named: #trait type: #FamixTTrait opposite: #incomingTraitUsages"

	<generated>
	<source>
	^ trait
]

{ #category : #accessing }
FamixTTraitUsage >> trait: anObject [

	<generated>
	trait := anObject
]

{ #category : #accessing }
FamixTTraitUsage >> user [
	"Relation named: #user type: #FamixTTraitUser opposite: #outgoingTraitUsages"

	<generated>
	<target>
	^ user
]

{ #category : #accessing }
FamixTTraitUsage >> user: anObject [

	<generated>
	user := anObject
]
