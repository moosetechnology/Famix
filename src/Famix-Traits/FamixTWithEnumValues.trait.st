"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `enumValues` | `FamixTWithEnumValues` | `parentEnum` | `FamixTEnumValue` | |



"
Trait {
	#name : #FamixTWithEnumValues,
	#instVars : [
		'#enumValues => FMMany type: #FamixTEnumValue opposite: #parentEnum'
	],
	#category : #'Famix-Traits-Enum'
}

{ #category : #meta }
FamixTWithEnumValues classSide >> annotation [

	<FMClass: #TWithEnumValues super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithEnumValues >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithEnumValues: self
]

{ #category : #accessing }
FamixTWithEnumValues >> addEnumValue: anObject [
	enumValues add: anObject

]

{ #category : #accessing }
FamixTWithEnumValues >> enumValues [
	"Relation named: #enumValues type: #FamixTEnumValue opposite: #parentEnum"

	<generated>
	<derived>
	^ enumValues
]

{ #category : #accessing }
FamixTWithEnumValues >> enumValues: anObject [

	<generated>
	enumValues value: anObject
]
