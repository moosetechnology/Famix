"
FamixTParametricEntity represents a type with parameters. It can be an parametricClass, parametricMethod, parametricInterface.
Example:

...
public Map<String,Collection> anAttribute;
...

Where Map<String,Collection> is the FamixTParametricEntity of anAttribute. String and Collection are concrete parameters. Map is the parametricClass.

## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretisations` | `FamixTParametricEntity` | `genericEntity` | `FamixTConcretisation` | concretisations relationships, i.e. known concreteEntities of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericEntity` | `FamixTParametricEntity` | `concreteEntity` | `FamixTConcretisation` | genericEntity relationships, i.e. known genericEntity of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concreteParameters` | `FamixTParametricEntity` | `concreteEntities` | `FamixTConcreteParameterType` | list of concreteParameters|
| `genericParameters` | `FamixTParametricEntity` | `genericEntities` | `FamixTGenericParameterType` | list of genericParameters|



"
Trait {
	#name : #FamixTParametricEntity,
	#instVars : [
		'#concreteParameters => FMMany type: #FamixTConcreteParameterType opposite: #concreteEntities',
		'#concretisations => FMMany type: #FamixTConcretisation opposite: #genericEntity',
		'#genericEntity => FMOne type: #FamixTConcretisation opposite: #concreteEntity',
		'#genericParameters => FMMany type: #FamixTGenericParameterType opposite: #genericEntities'
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
FamixTParametricEntity >> addGenericParameter: anObject [
	<generated>
	^ self genericParameters add: anObject
]

{ #category : #accessing }
FamixTParametricEntity >> allTypeParameters [

	^ (OrderedCollection new:
			   self concreteParameters size + self genericParameters size)
		  addAll: self concreteParameters;
		  addAll: self genericParameters;
		  yourself
]

{ #category : #accessing }
FamixTParametricEntity >> concreteParameters [
	"Relation named: #concreteParameters type: #FamixTConcreteParameterType opposite: #concreteEntities"

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
	<FMComment: 'concretisations relationships, i.e. known concreteEntities of this type.'>
	<derived>
	^ concretisations
]

{ #category : #accessing }
FamixTParametricEntity >> concretisations: anObject [

	<generated>
	concretisations value: anObject
]

{ #category : #accessing }
FamixTParametricEntity >> genericEntity [
	"Relation named: #genericEntity type: #FamixTConcretisation opposite: #concreteEntity"

	<generated>
	<FMComment: 'genericEntity relationships, i.e. known genericEntity of this type.'>
	<derived>
	^ genericEntity
]

{ #category : #accessing }
FamixTParametricEntity >> genericEntity: anObject [

	<generated>
	genericEntity := anObject
]

{ #category : #accessing }
FamixTParametricEntity >> genericParameters [
	"Relation named: #genericParameters type: #FamixTGenericParameterType opposite: #genericEntities"

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

	^ self isGenericEntity not
]

{ #category : #accessing }
FamixTParametricEntity >> isGenericEntity [
	"An Entity is generic if it has at least one ParameterType"

	self genericParameters ifNotEmpty: [ ^ true ].
	^ self concreteParameters anySatisfy: [ :p | p isParameterType ]
]

{ #category : #accessing }
FamixTParametricEntity >> rootGenericEntity [

	| root |
	root := self.
	[ root genericEntity isNotNil ] whileTrue: [
		root := root genericEntity ].
	^ root
]
