"
FamixTParametricEntity represents a type with parameters. It can be an parametricClass, parametricMethod, parametricInterface.
Example:

...
public Map<String,Collection> anAttribute;
...

Where Map<String,Collection> is the FamixTParametricEntity of anAttribute. String and Collection are concrete parameters. Map is the parametricClass.
"
Trait {
	#name : #FamixTParametricEntity,
	#instVars : [
		'#concreteParameters => FMMany type: #FamixTConcreteParameterType opposite: #concreteEntity',
		'#concretisations => FMMany type: #FamixTConcretisation opposite: #genericEntity',
		'#genericEntities => FMMany type: #FamixTConcretisation opposite: #concreteEntity',
		'#genericParameters => FMMany type: #FamixTGenericParameterType opposite: #genericEntity'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTParametricEntity classSide >> annotation [

	<FMClass: #TParametricEntity super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTParametricEntity >> addConcreteParameter: anObject [
	<generated>
	^ self concreteParameters add: anObject
]

{ #category : #adding }
FamixTParametricEntity >> addConcretisation: anObject [
	<generated>
	^ self concretisations add: anObject
]

{ #category : #adding }
FamixTParametricEntity >> addGenericEntity: anObject [
	<generated>
	^ self genericEntities add: anObject
]

{ #category : #adding }
FamixTParametricEntity >> addGenericParameter: anObject [
	<generated>
	^ self genericParameters add: anObject
]

{ #category : #accessing }
FamixTParametricEntity >> concreteParameters [
	"Relation named: #concreteParameters type: #FamixTConcreteParameterType opposite: #concreteEntity"

	<generated>
	<FMComment: 'list of concreteParameters'>
	^ concreteParameters
]

{ #category : #accessing }
FamixTParametricEntity >> concreteParameters: anObject [

	<generated>
	concreteParameters value: anObject
]

{ #category : #accessing }
FamixTParametricEntity >> concretisations [
	"Relation named: #concretisations type: #FamixTConcretisation opposite: #genericEntity"

	<generated>
	<FMComment: 'concretisations relationships, i.e. known concreteEntity of this type.'>
	<derived>
	^ concretisations
]

{ #category : #accessing }
FamixTParametricEntity >> concretisations: anObject [

	<generated>
	concretisations value: anObject
]

{ #category : #accessing }
FamixTParametricEntity >> genericEntities [
	"Relation named: #genericEntities type: #FamixTConcretisation opposite: #concreteEntity"

	<generated>
	<FMComment: 'genericEntities relationships, i.e. known genericEntity of this type.'>
	<derived>
	^ genericEntities
]

{ #category : #accessing }
FamixTParametricEntity >> genericEntities: anObject [

	<generated>
	genericEntities value: anObject
]

{ #category : #accessing }
FamixTParametricEntity >> genericParameters [
	"Relation named: #genericParameters type: #FamixTGenericParameterType opposite: #genericEntity"

	<generated>
	<FMComment: 'list of genericParameters'>
	^ genericParameters
]

{ #category : #accessing }
FamixTParametricEntity >> genericParameters: anObject [

	<generated>
	genericParameters value: anObject
]

{ #category : #accessing }
FamixTParametricEntity >> isConcreteEntity [
"An Entity is generic if it has at least one ParameterType"

	| param res |
	res := true.
	param := OrderedCollection new.
	param addAll: self genericParameters.
	param addAll: self concreteParameters.
	param do: [ :p | p isParameterType 
		ifTrue: [ res := false ]  ].
	^ res.
	
	"self genericParameters ifNotEmpty: [ ^ false ] 
	ifEmpty: [^ true]."
]

{ #category : #accessing }
FamixTParametricEntity >> isGenericEntity [
"An Entity is generic if it has at least one ParameterType"

	| param res |
	res := false.
	param := OrderedCollection new.
	param addAll: self genericParameters.
	param addAll: self concreteParameters.
	param do: [ :p | p isParameterType 
		ifTrue: [ res := true ]  ].
	^ res.
]

{ #category : #accessing }
FamixTParametricEntity >> parametricParameters [

	|collection|
	collection := OrderedCollection new.
	collection addAll: self concreteParameters , self genericParameters .
	^ collection 
]
