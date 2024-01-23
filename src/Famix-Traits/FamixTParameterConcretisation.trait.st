"
## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
| `genericParameter` | `FamixTParameterConcretisation` | `concretisations` | `FamixTGenericParameterType` | genericParameter linked to in this relationship. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
| `concreteParameter` | `FamixTParameterConcretisation` | `generics` | `FamixTConcreteParameterType` | concreteParameter linked to in this relationship. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `concretisations` | `FamixTParameterConcretisation` | `parameterConcretisations` | `FamixTConcretisation` | |
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Trait {
	#name : #FamixTParameterConcretisation,
	#instVars : [
		'#concreteParameter => FMOne type: #FamixTConcreteParameterType opposite: #generics',
		'#concretisations => FMMany type: #FamixTConcretisation opposite: #parameterConcretisations',
		'#genericParameter => FMOne type: #FamixTGenericParameterType opposite: #concretisations'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTParameterConcretisation classSide >> annotation [

	<FMClass: #TParameterConcretisation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTParameterConcretisation >> addConcretisation: anObject [
	<generated>
	^ self concretisations add: anObject
]

{ #category : #accessing }
FamixTParameterConcretisation >> concreteParameter [
	"Relation named: #concreteParameter type: #FamixTConcreteParameterType opposite: #generics"

	<generated>
	<FMComment: 'concreteParameter linked to in this relationship. to-side of the association'>
	<target>
	^ concreteParameter
]

{ #category : #accessing }
FamixTParameterConcretisation >> concreteParameter: anObject [

	<generated>
	concreteParameter := anObject
]

{ #category : #accessing }
FamixTParameterConcretisation >> concretisations [
	"Relation named: #concretisations type: #FamixTConcretisation opposite: #parameterConcretisations"

	<generated>
	^ concretisations
]

{ #category : #accessing }
FamixTParameterConcretisation >> concretisations: anObject [

	<generated>
	concretisations value: anObject
]

{ #category : #accessing }
FamixTParameterConcretisation >> genericParameter [
	"Relation named: #genericParameter type: #FamixTGenericParameterType opposite: #concretisations"

	<generated>
	<FMComment: 'genericParameter linked to in this relationship. from-side of the association'>
	<source>
	^ genericParameter
]

{ #category : #accessing }
FamixTParameterConcretisation >> genericParameter: anObject [

	<generated>
	genericParameter := anObject
]
