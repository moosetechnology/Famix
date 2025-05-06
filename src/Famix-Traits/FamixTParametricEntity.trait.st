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
| `concretizations` | `FamixTParametricEntity` | `genericEntity` | `FamixTConcretization` | Concretization relationships, i.e. the associations of known concrete entities of this type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericization` | `FamixTParametricEntity` | `concreteEntity` | `FamixTConcretization` | Generic entity relationship, i.e. the association to the generic entity of this type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concreteParameters` | `FamixTParametricEntity` | `concreteEntities` | `FamixTConcreteParameterType` | List of concrete parameters.|
| `genericParameters` | `FamixTParametricEntity` | `genericEntities` | `FamixTGenericParameterType` | List of generic parameters.|



"
Trait {
	#name : #FamixTParametricEntity,
	#instVars : [
		'#concreteParameters => FMMany type: #FamixTConcreteParameterType opposite: #concreteEntities',
		'#concretizations => FMMany type: #FamixTConcretization opposite: #genericEntity',
		'#genericParameters => FMMany type: #FamixTGenericParameterType opposite: #genericEntities',
		'#genericization => FMOne type: #FamixTConcretization opposite: #concreteEntity'
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

{ #category : #visitor }
FamixTParametricEntity >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTParametricEntity: self
]

{ #category : #adding }
FamixTParametricEntity >> addConcreteParameter: anObject [
	<generated>
	^ self concreteParameters add: anObject
]

{ #category : #adding }
FamixTParametricEntity >> addConcretization: anObject [
	<generated>
	^ self concretizations add: anObject
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
	<FMComment: 'List of concrete parameters.'>
	^ concreteParameters
]

{ #category : #accessing }
FamixTParametricEntity >> concreteParameters: anObject [

	<generated>
	concreteParameters value: anObject
]

{ #category : #accessing }
FamixTParametricEntity >> concretizations [
	"Relation named: #concretizations type: #FamixTConcretization opposite: #genericEntity"

	<generated>
	<FMComment: 'Concretization relationships, i.e. the associations of known concrete entities of this type.'>
	<derived>
	^ concretizations
]

{ #category : #accessing }
FamixTParametricEntity >> concretizations: anObject [

	<generated>
	concretizations value: anObject
]

{ #category : #accessing }
FamixTParametricEntity >> genericEntity [
	"Returns the generic entity that typically holds relevant information, such as the source anchor."

	^ self genericization
		  ifNil: [ self ]
		  ifNotNil: [ :concretization | concretization genericEntity ]
]

{ #category : #accessing }
FamixTParametricEntity >> genericParameters [
	"Relation named: #genericParameters type: #FamixTGenericParameterType opposite: #genericEntities"

	<generated>
	<FMComment: 'List of generic parameters.'>
	^ genericParameters
]

{ #category : #accessing }
FamixTParametricEntity >> genericParameters: anObject [

	<generated>
	genericParameters value: anObject
]

{ #category : #accessing }
FamixTParametricEntity >> genericization [
	"Relation named: #genericization type: #FamixTConcretization opposite: #concreteEntity"

	<generated>
	<FMComment: 'Generic entity relationship, i.e. the association to the generic entity of this type.'>
	<derived>
	^ genericization
]

{ #category : #accessing }
FamixTParametricEntity >> genericization: anObject [

	<generated>
	genericization := anObject
]

{ #category : #accessing }
FamixTParametricEntity >> isConcreteEntity [
	"I am concrete if I concretize a generic entity."

	^ self genericization isNotNil
]

{ #category : #accessing }
FamixTParametricEntity >> isGenericEntity [
	"I am generic if I don't concretize a generic entity."

	^ self genericization isNil
]

{ #category : #testing }
FamixTParametricEntity >> isParametricEntity [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTParametricEntity >> usesGenerics [
	"Concrete parameters can still be generic, e.g. in Java:
	<C> List<C> foo(C bar);
	List<C> is a concretization of the generic interface List<T>, where C concretizes T, but is still generic."

	self genericParameters ifNotEmpty: [ ^ true ].
	^ self concreteParameters anySatisfy: [ :p | p isParameterType ]
]
