Trait {
	#name : #FamixTParameterConcretisation,
	#instVars : [
		'#concreteParameter => FMOne type: #FamixTConcreteParameterType opposite: #generic',
		'#concretisation => FMMany type: #FamixTConcretisation opposite: #parameterConcretisation',
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
	^ self concretisation add: anObject
]

{ #category : #accessing }
FamixTParameterConcretisation >> concreteParameter [
	"Relation named: #concreteParameter type: #FamixTConcreteParameterType opposite: #generic"

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
FamixTParameterConcretisation >> concretisation [
	"Relation named: #concretisation type: #FamixTConcretisation opposite: #parameterConcretisation"

	<generated>
	^ concretisation
]

{ #category : #accessing }
FamixTParameterConcretisation >> concretisation: anObject [

	<generated>
	concretisation value: anObject
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
