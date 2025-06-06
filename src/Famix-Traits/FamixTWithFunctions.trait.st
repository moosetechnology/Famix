"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `functions` | `FamixTWithFunctions` | `functionOwner` | `FamixTFunction` | Functions defined in the container, if any.|



"
Trait {
	#name : #FamixTWithFunctions,
	#instVars : [
		'#functions => FMMany type: #FamixTFunction opposite: #functionOwner'
	],
	#category : #'Famix-Traits-Behavioral'
}

{ #category : #meta }
FamixTWithFunctions classSide >> annotation [

	<FMClass: #TWithFunctions super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithFunctions >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithFunctions: self
]

{ #category : #accessing }
FamixTWithFunctions >> addFunction: anObject [
	functions add: anObject

]

{ #category : #accessing }
FamixTWithFunctions >> functions [
	"Relation named: #functions type: #FamixTFunction opposite: #functionOwner"

	<generated>
	<FMComment: 'Functions defined in the container, if any.'>
	<derived>
	^ functions
]

{ #category : #accessing }
FamixTWithFunctions >> functions: anObject [

	<generated>
	functions value: anObject
]
