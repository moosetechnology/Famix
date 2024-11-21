"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericEntity` | `FamixTConcretization` | `concretizations` | `FamixTParametricEntity` | Generic entity linked to in this relationship. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concreteEntity` | `FamixTConcretization` | `genericization` | `FamixTParametricEntity` | Concrete entity linked to in this relationship. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `parameterConcretizations` | `FamixTConcretization` | `concretizations` | `FamixTParameterConcretization` | |
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Trait {
	#name : #FamixTConcretization,
	#instVars : [
		'#parameterConcretizations => FMMany type: #FamixTParameterConcretization opposite: #concretizations',
		'#genericEntity => FMOne type: #FamixTParametricEntity opposite: #concretizations',
		'#concreteEntity => FMOne type: #FamixTParametricEntity opposite: #genericization'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTConcretization classSide >> annotation [

	<FMClass: #TConcretization super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTConcretization >> addParameterConcretization: anObject [
	<generated>
	^ self parameterConcretizations add: anObject
]

{ #category : #accessing }
FamixTConcretization >> concreteEntity [
	"Relation named: #concreteEntity type: #FamixTParametricEntity opposite: #genericization"

	<generated>
	<FMComment: 'Concrete entity linked to in this relationship. to-side of the association'>
	<target>
	^ concreteEntity
]

{ #category : #accessing }
FamixTConcretization >> concreteEntity: anObject [

	<generated>
	concreteEntity := anObject
]

{ #category : #accessing }
FamixTConcretization >> genericEntity [
	"Relation named: #genericEntity type: #FamixTParametricEntity opposite: #concretizations"

	<generated>
	<FMComment: 'Generic entity linked to in this relationship. from-side of the association'>
	<source>
	^ genericEntity
]

{ #category : #accessing }
FamixTConcretization >> genericEntity: anObject [

	<generated>
	genericEntity := anObject
]

{ #category : #accessing }
FamixTConcretization >> parameterConcretizations [
	"Relation named: #parameterConcretizations type: #FamixTParameterConcretization opposite: #concretizations"

	<generated>
	<derived>
	^ parameterConcretizations
]

{ #category : #accessing }
FamixTConcretization >> parameterConcretizations: anObject [

	<generated>
	parameterConcretizations value: anObject
]
