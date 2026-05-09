"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|



"
Trait {
	#name : 'FamixTWithAttributes',
	#instVars : [
		'#attributes => FMMany type: #FamixTAttribute opposite: #parentType'
	],
	#category : 'Famix-Traits-Attribute',
	#package : 'Famix-Traits',
	#tag : 'Attribute'
}

{ #category : 'meta' }
FamixTWithAttributes classSide >> annotation [

	<FMClass: #TWithAttributes super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'visitor' }
FamixTWithAttributes >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithAttributes: self
]

{ #category : 'adding' }
FamixTWithAttributes >> addAttribute: anAttribute [
	attributes add: anAttribute
]

{ #category : 'accessing' }
FamixTWithAttributes >> attributes [
	"Relation named: #attributes type: #FamixTAttribute opposite: #parentType"

	<generated>
	<FMComment: 'List of attributes declared by this type.'>
	<derived>
	^ attributes
]

{ #category : 'accessing' }
FamixTWithAttributes >> attributes: anObject [

	<generated>
	attributes value: anObject
]

{ #category : 'Famix-Extensions' }
FamixTWithAttributes >> numberOfAttributes [

	<FMProperty: #numberOfAttributes type: #Number>
	<derived>
	<FMComment: 'The number of attributes in the class'>
	^ self cacheAt: #numberOfAttributes ifAbsent: [ self attributes size ]
]

{ #category : 'Famix-Extensions' }
FamixTWithAttributes >> numberOfAttributes: aNumber [
	self cacheAt: #numberOfAttributes put: aNumber
]
