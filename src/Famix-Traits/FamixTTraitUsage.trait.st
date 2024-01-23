"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
| `trait` | `FamixTTraitUsage` | `incomingTraitUsages` | `FamixTTrait` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
| `user` | `FamixTTraitUsage` | `outgoingTraitUsages` | `FamixTTraitUser` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

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
