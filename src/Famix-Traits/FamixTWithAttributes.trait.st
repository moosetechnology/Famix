"
## Relations
======================

### Children
| Relation | Type | Opposite | Comment |
| `attributes` | `FamixTAttribute` | `parentType` | List of attributes declared by this type.|



"
Trait {
	#name : #FamixTWithAttributes,
	#instVars : [
		'#attributes => FMMany type: #FamixTAttribute opposite: #parentType'
	],
	#category : #'Famix-Traits-Attribute'
}

{ #category : #meta }
FamixTWithAttributes classSide >> annotation [

	<FMClass: #TWithAttributes super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTWithAttributes >> addAttribute: anAttribute [
	attributes add: anAttribute
]

{ #category : #accessing }
FamixTWithAttributes >> attributes [
	"Relation named: #attributes type: #FamixTAttribute opposite: #parentType"

	<generated>
	<FMComment: 'List of attributes declared by this type.'>
	<derived>
	^ attributes
]

{ #category : #accessing }
FamixTWithAttributes >> attributes: anObject [

	<generated>
	attributes value: anObject
]

{ #category : #'Famix-Extensions' }
FamixTWithAttributes >> numberOfAttributes [
	<FMProperty: #numberOfAttributes type: #Number>
	<derived>
	<FMComment: 'The number of attributes in the class'>
	
	^self
		lookUpPropertyNamed: #numberOfAttributes
		computedAs: [self attributes size]
]

{ #category : #'Famix-Extensions' }
FamixTWithAttributes >> numberOfAttributes: aNumber [
	self cacheAt: #numberOfAttributes put: aNumber
]
