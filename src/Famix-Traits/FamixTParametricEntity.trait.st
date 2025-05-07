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
| `typeParameters` | `FamixTParametricEntity` | `genericEntity` | `FamixTTypeParameter` | The type parameters of this parametric entity. They can any type with the exception of primitive types|



"
Trait {
	#name : #FamixTParametricEntity,
	#instVars : [
		'#typeParameters => FMMany type: #FamixTTypeParameter opposite: #genericEntity'
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

	self deprecated:
		'Since we do not represent parameterized (i.e. "concrete") entities anymore, a parametric entity is always generic'.

	^ self
]

{ #category : #accessing }
FamixTParametricEntity >> isConcreteEntity [

	self deprecated:
		'Since we do not represent parameterized (i.e. "concrete") entities anymore, a parametric entity is always generic'.

	^ false
]

{ #category : #accessing }
FamixTParametricEntity >> isGenericEntity [

	self deprecated:
		'Since we do not represent parameterized (i.e. "concrete") entities anymore, a parametric entity is always generic'.

	^ self genericization isNil
]

{ #category : #testing }
FamixTParametricEntity >> isParametricEntity [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTParametricEntity >> typeParameters [
	"Relation named: #typeParameters type: #FamixTTypeParameter opposite: #genericEntity"

	<generated>
	<FMComment: 'The type parameters of this parametric entity. They can any type with the exception of primitive types'>
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

	self deprecated:
		'Since we do not represent parameterized (i.e. "concrete") entities anymore, a parametric entity is always generic. It has at least one type parameter'.

	^ true
]
