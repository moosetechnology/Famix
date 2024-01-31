"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `genericEntity` | `FamixTConcretisation` | `concretisations` | `FamixTParametricEntity` | genericEntity linked to in this relationship. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concreteEntity` | `FamixTConcretisation` | `genericization` | `FamixTParametricEntity` | concreteEntity linked to in this relationship. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `parameterConcretisations` | `FamixTConcretisation` | `concretisations` | `FamixTParameterConcretisation` | |
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Trait {
	#name : #FamixTConcretisation,
	#instVars : [
		'#concreteEntity => FMOne type: #FamixTParametricEntity opposite: #genericization',
		'#genericEntity => FMOne type: #FamixTParametricEntity opposite: #concretisations',
		'#parameterConcretisations => FMMany type: #FamixTParameterConcretisation opposite: #concretisations'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTConcretisation classSide >> annotation [

	<FMClass: #TConcretisation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTConcretisation >> addParameterConcretisation: anObject [
	<generated>
	^ self parameterConcretisations add: anObject
]

{ #category : #accessing }
FamixTConcretisation >> concreteEntity [
	"Relation named: #concreteEntity type: #FamixTParametricEntity opposite: #genericization"

	<generated>
	<FMComment: 'concreteEntity linked to in this relationship. to-side of the association'>
	<target>
	^ concreteEntity
]

{ #category : #accessing }
FamixTConcretisation >> concreteEntity: anObject [

	<generated>
	concreteEntity := anObject
]

{ #category : #accessing }
FamixTConcretisation >> genericEntity [
	"Relation named: #genericEntity type: #FamixTParametricEntity opposite: #concretisations"

	<generated>
	<FMComment: 'genericEntity linked to in this relationship. from-side of the association'>
	<source>
	^ genericEntity
]

{ #category : #accessing }
FamixTConcretisation >> genericEntity: anObject [

	<generated>
	genericEntity := anObject
]

{ #category : #accessing }
FamixTConcretisation >> parameterConcretisations [
	"Relation named: #parameterConcretisations type: #FamixTParameterConcretisation opposite: #concretisations"

	<generated>
	<derived>
	^ parameterConcretisations
]

{ #category : #accessing }
FamixTConcretisation >> parameterConcretisations: anObject [

	<generated>
	parameterConcretisations value: anObject
]
