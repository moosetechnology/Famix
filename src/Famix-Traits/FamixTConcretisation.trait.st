Trait {
	#name : #FamixTConcretisation,
	#instVars : [
		'#concreteEntity => FMOne type: #FamixTParametricEntity opposite: #genericEntities',
		'#genericEntity => FMOne type: #FamixTParametricEntity opposite: #concretisations',
		'#parameterConcretisation => FMMany type: #FamixTParameterConcretisation opposite: #concretisation'
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
	^ self parameterConcretisation add: anObject
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
FamixTConcretisation >> parameterConcretisation [
	"Relation named: #parameterConcretisation type: #FamixTParameterConcretisation opposite: #concretisation"

	<generated>
	<derived>
	^ parameterConcretisation
]

{ #category : #accessing }
FamixTConcretisation >> parameterConcretisation: anObject [

	<generated>
	parameterConcretisation value: anObject
]
