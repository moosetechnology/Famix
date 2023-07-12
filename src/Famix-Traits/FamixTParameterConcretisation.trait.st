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
