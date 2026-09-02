"
A type that can be the source of a concretization. Entities using this trait should also use TType.

## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `outgoingConcretizations` | `FamixTTypeArgument` | `typeArgument` | `FamixTConcretization` | Concretizations where this type is the type argument.|



"
Trait {
	#name : 'FamixTTypeArgument',
	#instVars : [
		'#outgoingConcretizations => FMMany type: #FamixTConcretization opposite: #typeArgument'
	],
	#category : 'Famix-Traits-Parametrics',
	#package : 'Famix-Traits',
	#tag : 'Parametrics'
}

{ #category : 'meta' }
FamixTTypeArgument classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TTypeArgument super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'adding' }
FamixTTypeArgument >> addOutgoingConcretization: anObject [

	<ignoreForCoverage>
	<generated>
	^ self outgoingConcretizations add: anObject
]

{ #category : 'accessing' }
FamixTTypeArgument >> outgoingConcretizations [
	"Relation named: #outgoingConcretizations type: #FamixTConcretization opposite: #typeArgument"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Concretizations where this type is the type argument.'>
	<derived>
	^ outgoingConcretizations
]

{ #category : 'accessing' }
FamixTTypeArgument >> outgoingConcretizations: anObject [

	<ignoreForCoverage>
	<generated>
	outgoingConcretizations value: anObject
]
