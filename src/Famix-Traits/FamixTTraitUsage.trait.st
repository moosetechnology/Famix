"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `trait` | `FamixTTraitUsage` | `incomingTraitUsages` | `FamixTTrait` | |

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `user` | `FamixTTraitUsage` | `traitUsages` | `FamixTTraitUser` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Trait {
	#name : #FamixTTraitUsage,
	#instVars : [
		'#trait => FMOne type: #FamixTTrait opposite: #incomingTraitUsages',
		'#user => FMOne type: #FamixTTraitUser opposite: #traitUsages'
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

{ #category : #visitor }
FamixTTraitUsage >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTTraitUsage: self
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
	"Relation named: #user type: #FamixTTraitUser opposite: #traitUsages"

	<generated>
	<target>
	^ user
]

{ #category : #accessing }
FamixTTraitUsage >> user: anObject [

	<generated>
	user := anObject
]
