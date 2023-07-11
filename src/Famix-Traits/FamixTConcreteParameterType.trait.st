"
FamixTConcreteParameterType represents the concretePamameters of an FamixTParametricEntity. it can be a class or a ParameterType that has one FamixTParameterConcretization
"
Trait {
	#name : #FamixTConcreteParameterType,
	#instVars : [
		'#concreteEntity => FMMany type: #FamixTParametricEntity opposite: #concreteParameters',
		'#generic => FMMany type: #FamixTParameterConcretisation opposite: #concreteParameter'
	],
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTConcreteParameterType classSide >> annotation [

	<FMClass: #TConcreteParameterType super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #adding }
FamixTConcreteParameterType >> addConcreteEntity: anObject [
	<generated>
	^ self concreteEntity add: anObject
]

{ #category : #adding }
FamixTConcreteParameterType >> addGeneric: anObject [
	<generated>
	^ self generic add: anObject
]

{ #category : #accessing }
FamixTConcreteParameterType >> concreteEntity [
	"Relation named: #concreteEntity type: #FamixTParametricEntity opposite: #concreteParameters"

	<generated>
	<FMComment: 'concreteEntity of a parameter'>
	<derived>
	^ concreteEntity
]

{ #category : #accessing }
FamixTConcreteParameterType >> concreteEntity: anObject [

	<generated>
	concreteEntity value: anObject
]

{ #category : #accessing }
FamixTConcreteParameterType >> generic [
	"Relation named: #generic type: #FamixTParameterConcretisation opposite: #concreteParameter"

	<generated>
	<FMComment: 'generic relationships, i.e. known genericParameter of this type.'>
	<derived>
	^ generic
]

{ #category : #accessing }
FamixTConcreteParameterType >> generic: anObject [

	<generated>
	generic value: anObject
]
