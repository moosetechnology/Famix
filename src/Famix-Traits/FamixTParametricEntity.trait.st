"
FamixTParametricEntity represents a type with parameters. It can be an parametricClass, parametricMethod, parametricInterface.
Example:

...
public Map<String,Collection> anAttribute;
...

Where Map<String,Collection> is the FamixTParametricEntity of anAttribute. String and Collection are concrete parameters. Map is the parametricClass.

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameters` | `FamixTParametricEntity` | `genericEntities` | `FamixTConcreteType` | The parameters of this parametric entity. They can be concrete classes or types or generic type parameters|



"
Trait {
	#name : #FamixTParametricEntity,
	#instVars : [
		'#typeParameters => FMMany type: #FamixTConcreteType opposite: #genericEntities'
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
FamixTParametricEntity >> addTypeParameter: anObject [
	<generated>
	^ self typeParameters add: anObject
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
FamixTParametricEntity >> genericEntity [
	"Returns the generic entity that typically holds relevant information, such as the source anchor."

	^ self genericization
		  ifNil: [ self ]
		  ifNotNil: [ :concretization | concretization genericEntity ]
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
FamixTParametricEntity >> typeParameters [
	"Relation named: #typeParameters type: #FamixTConcreteType opposite: #genericEntities"

	<generated>
	<FMComment: 'The parameters of this parametric entity. They can be concrete classes or types or generic type parameters'>
	<derived>
	^ typeParameters
]

{ #category : #accessing }
FamixTParametricEntity >> typeParameters: anObject [

	<generated>
	typeParameters value: anObject
]

{ #category : #accessing }
FamixTParametricEntity >> usesGenerics [
	"Concrete parameters can still be generic, e.g. in Java:
	<C> List<C> foo(C bar);
	List<C> is a concretization of the generic interface List<T>, where C concretizes T, but is still generic."

	self genericParameters ifNotEmpty: [ ^ true ].
	^ self concreteParameters anySatisfy: [ :p | p isParameterType ]
]
