"
I represent an entity that can owned lambda expressions.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `lambdas` | `FamixTWithLambdas` | `lambdaContainer` | `FamixTLambda` | Lambdas defined in the container, if any.|



"
Trait {
	#name : #FamixTWithLambdas,
	#instVars : [
		'#lambdas => FMMany type: #FamixTLambda opposite: #lambdaContainer'
	],
	#category : #'Famix-Traits-Lambda'
}

{ #category : #meta }
FamixTWithLambdas classSide >> annotation [

	<FMClass: #TWithLambdas super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithLambdas >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithLambdas: self
]

{ #category : #adding }
FamixTWithLambdas >> addLambda: anObject [
	<generated>
	^ self lambdas add: anObject
]

{ #category : #accessing }
FamixTWithLambdas >> lambdas [
	"Relation named: #lambdas type: #FamixTLambda opposite: #lambdaContainer"

	<generated>
	<FMComment: 'Lambdas defined in the container, if any.'>
	<derived>
	^ lambdas
]

{ #category : #accessing }
FamixTWithLambdas >> lambdas: anObject [

	<generated>
	lambdas value: anObject
]
