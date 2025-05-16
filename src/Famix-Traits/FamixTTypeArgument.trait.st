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
	#name : #FamixTTypeArgument,
	#instVars : [
		'#outgoingConcretizations => FMMany type: #FamixTConcretization opposite: #typeArgument'
	],
	#category : #'Famix-Traits-Parametrics'
}

{ #category : #meta }
FamixTTypeArgument classSide >> annotation [

	<FMClass: #TTypeArgument super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTTypeArgument >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTTypeArgument: self
]

{ #category : #adding }
FamixTTypeArgument >> addOutgoingConcretization: anObject [
	<generated>
	^ self outgoingConcretizations add: anObject
]

{ #category : #accessing }
FamixTTypeArgument >> outgoingConcretizations [
	"Relation named: #outgoingConcretizations type: #FamixTConcretization opposite: #typeArgument"

	<generated>
	<FMComment: 'Concretizations where this type is the type argument.'>
	<derived>
	^ outgoingConcretizations
]

{ #category : #accessing }
FamixTTypeArgument >> outgoingConcretizations: anObject [

	<generated>
	outgoingConcretizations value: anObject
]
