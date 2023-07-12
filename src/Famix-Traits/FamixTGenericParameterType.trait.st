"
FamixTGenericParameterType represents generic parameters in an FamixJavaParametricEntity. This is an FamixJavaParameterType
"
Trait {
	#name : #FamixTGenericParameterType,
	#instVars : [
		'#concretisations => FMMany type: #FamixTParameterConcretisation opposite: #genericParameter',
		'#genericEntities => FMMany type: #FamixTParametricEntity opposite: #genericParameters'
	],
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTGenericParameterType classSide >> annotation [

	<FMClass: #TGenericParameterType super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTGenericParameterType >> addConcretisation: anObject [
	<generated>
	^ self concretisations add: anObject
]

{ #category : #adding }
FamixTGenericParameterType >> addGenericEntity: anObject [
	<generated>
	^ self genericEntities add: anObject
]

{ #category : #accessing }
FamixTGenericParameterType >> concretisations [
	"Relation named: #concretisations type: #FamixTParameterConcretisation opposite: #genericParameter"

	<generated>
	<FMComment: 'concretisations relationships, i.e. known concretisation of this type.'>
	<derived>
	^ concretisations
]

{ #category : #accessing }
FamixTGenericParameterType >> concretisations: anObject [

	<generated>
	concretisations value: anObject
]

{ #category : #accessing }
FamixTGenericParameterType >> genericEntities [
	"Relation named: #genericEntities type: #FamixTParametricEntity opposite: #genericParameters"

	<generated>
	<FMComment: 'genericEntity of a parameter'>
	<derived>
	^ genericEntities
]

{ #category : #accessing }
FamixTGenericParameterType >> genericEntities: anObject [

	<generated>
	genericEntities value: anObject
]
