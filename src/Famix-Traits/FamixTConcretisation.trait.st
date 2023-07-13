Trait {
	#name : #FamixTConcretisation,
	#instVars : [
		'#concreteEntity => FMOne type: #FamixTParametricEntity opposite: #genericEntities',
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
	"Relation named: #concreteEntity type: #FamixTParametricEntity opposite: #genericEntities"

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
