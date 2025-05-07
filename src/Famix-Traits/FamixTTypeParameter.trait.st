"
The generic type parameter associated to a ParametricEntity. Entities using this trait should also use TType.

## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTTypeParameter` | `typeParameter` | `FamixTConcretization` | Known concretizations of this type parameter.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericEntity` | `FamixTTypeParameter` | `typeParameters` | `FamixTParametricEntity` | Generic entity that declares this type parameter.|



"
Trait {
	#name : #FamixTTypeParameter,
	#instVars : [
		'#concretizations => FMMany type: #FamixTConcretization opposite: #typeParameter',
		'#genericEntity => FMOne type: #FamixTParametricEntity opposite: #typeParameters'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTTypeParameter classSide >> annotation [

	<FMClass: #TTypeParameter super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTTypeParameter >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTTypeParameter: self
]

{ #category : #adding }
FamixTTypeParameter >> addConcretization: anObject [
	<generated>
	^ self concretizations add: anObject
]

{ #category : #accessing }
FamixTTypeParameter >> concretizations [
	"Relation named: #concretizations type: #FamixTConcretization opposite: #typeParameter"

	<generated>
	<FMComment: 'Known concretizations of this type parameter.'>
	<derived>
	^ concretizations
]

{ #category : #accessing }
FamixTTypeParameter >> concretizations: anObject [

	<generated>
	concretizations value: anObject
]

{ #category : #accessing }
FamixTTypeParameter >> genericEntity [
	"Relation named: #genericEntity type: #FamixTParametricEntity opposite: #typeParameters"

	<generated>
	<FMComment: 'Generic entity that declares this type parameter.'>
	^ genericEntity
]

{ #category : #accessing }
FamixTTypeParameter >> genericEntity: anObject [

	<generated>
	genericEntity := anObject
]
