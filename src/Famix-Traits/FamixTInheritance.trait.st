"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
| `subclass` | `FamixTInheritance` | `superInheritances` | `FamixTWithInheritances` | Subclass linked to in this relationship. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
| `superclass` | `FamixTInheritance` | `subInheritances` | `FamixTWithInheritances` | Superclass linked to in this relationship. to-side of the association|

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
	#name : #FamixTInheritance,
	#instVars : [
		'#subclass => FMOne type: #FamixTWithInheritances opposite: #superInheritances',
		'#superclass => FMOne type: #FamixTWithInheritances opposite: #subInheritances'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Inheritance'
}

{ #category : #meta }
FamixTInheritance classSide >> annotation [

	<FMClass: #TInheritance super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #printing }
FamixTInheritance >> displayStringOn: aStream [

	self subclass displayStringOn: aStream.
	aStream << ' -|> '.
	self superclass displayStringOn: aStream
]

{ #category : #testing }
FamixTInheritance >> isInheritance [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTInheritance >> subclass [
	"Relation named: #subclass type: #FamixTWithInheritances opposite: #superInheritances"

	<generated>
	<FMComment: 'Subclass linked to in this relationship. from-side of the association'>
	<source>
	^ subclass
]

{ #category : #accessing }
FamixTInheritance >> subclass: anObject [

	<generated>
	subclass := anObject
]

{ #category : #accessing }
FamixTInheritance >> superclass [
	"Relation named: #superclass type: #FamixTWithInheritances opposite: #subInheritances"

	<generated>
	<FMComment: 'Superclass linked to in this relationship. to-side of the association'>
	<target>
	^ superclass
]

{ #category : #accessing }
FamixTInheritance >> superclass: anObject [

	<generated>
	superclass := anObject
]
