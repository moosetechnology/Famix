"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `header` | `FamixTWithHeaders` | `headerOwner` | `FamixTHeader` | The header file that defines this module|



"
Trait {
	#name : #FamixTWithHeaders,
	#instVars : [
		'#header => FMOne type: #FamixTHeader opposite: #headerOwner'
	],
	#category : #'Famix-Traits-Header'
}

{ #category : #meta }
FamixTWithHeaders classSide >> annotation [

	<FMClass: #TWithHeaders super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTWithHeaders >> header [
	"Relation named: #header type: #FamixTHeader opposite: #headerOwner"

	<generated>
	<FMComment: 'The header file that defines this module'>
	<derived>
	^ header
]

{ #category : #accessing }
FamixTWithHeaders >> header: anObject [

	<generated>
	header := anObject
]
