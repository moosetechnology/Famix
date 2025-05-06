"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameters` | `FamixTWithParameters` | `parentBehaviouralEntity` | `FamixTParameter` | List of formal parameters declared by this behaviour.|



"
Trait {
	#name : #FamixTWithParameters,
	#instVars : [
		'#parameters => FMMany type: #FamixTParameter opposite: #parentBehaviouralEntity'
	],
	#category : #'Famix-Traits-Parameter'
}

{ #category : #meta }
FamixTWithParameters classSide >> annotation [

	<FMClass: #TWithParameters super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTWithParameters >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithParameters: self
]

{ #category : #adding }
FamixTWithParameters >> addParameter: aParameter [ 
	parameters add: aParameter
]

{ #category : #accessing }
FamixTWithParameters >> numberOfParameters [
	<FMProperty: #numberOfParameters type: #Number>
	<FMComment: 'The number of parameters in a method'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfParameters computedAs: [ self parameters size ]
]

{ #category : #accessing }
FamixTWithParameters >> numberOfParameters: aNumber [
	self cacheAt: #numberOfParameters put: aNumber
]

{ #category : #accessing }
FamixTWithParameters >> parameters [
	"Relation named: #parameters type: #FamixTParameter opposite: #parentBehaviouralEntity"

	<generated>
	<FMComment: 'List of formal parameters declared by this behaviour.'>
	<derived>
	^ parameters
]

{ #category : #accessing }
FamixTWithParameters >> parameters: anObject [

	<generated>
	parameters value: anObject
]
