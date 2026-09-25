"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `types` | `FamixTWithTypes` | `typeContainer` | `FamixTType` | Types contained (declared) in this entity, if any. #types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.|



"
Trait {
	#name : 'FamixTWithTypes',
	#instVars : [
		'#types => FMMany type: #FamixTType opposite: #typeContainer'
	],
	#category : 'Famix-Traits-Type',
	#package : 'Famix-Traits',
	#tag : 'Type'
}

{ #category : 'meta' }
FamixTWithTypes classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithTypes super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTWithTypes >> addType: aType [ 
	types add: aType
]

{ #category : 'accessing' }
FamixTWithTypes >> allRecursiveTypes [
	"Retrieves all nested types recursively"
	
	| result |
	result := Set new.
	self allRecursiveTypesDo: [:each | result add: each ].
	^ result
]

{ #category : 'accessing' }
FamixTWithTypes >> allRecursiveTypesDo: aBlock [
	"Traverses all nested types recursively"

	self types do: [ :each | 
		aBlock value: each.
		each allRecursiveTypesDo: aBlock ]
]

{ #category : 'accessing' }
FamixTWithTypes >> types [
	"Relation named: #types type: #FamixTType opposite: #typeContainer"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.'>
	<derived>
	^ types
]

{ #category : 'accessing' }
FamixTWithTypes >> types: anObject [

	<ignoreForCoverage>
	<generated>
	types value: anObject
]
