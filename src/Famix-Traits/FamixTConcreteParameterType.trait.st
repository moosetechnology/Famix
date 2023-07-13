"
FamixTConcreteParameterType represents the concretePamameters of an FamixTParametricEntity. it can be a class or a ParameterType that has one FamixTParameterConcretization
"
Trait {
	#name : #FamixTConcreteParameterType,
	#instVars : [
		'#concreteEntities => FMMany type: #FamixTParametricEntity opposite: #concreteParameters',
		'#generics => FMMany type: #FamixTParameterConcretisation opposite: #concreteParameter'
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
	^ self concreteEntities add: anObject
]

{ #category : #adding }
FamixTConcreteParameterType >> addGeneric: anObject [
	<generated>
	^ self generics add: anObject
]

{ #category : #accessing }
FamixTConcreteParameterType >> concreteEntities [
	"Relation named: #concreteEntities type: #FamixTParametricEntity opposite: #concreteParameters"

	<generated>
	<FMComment: 'concreteEntity of a parameter'>
	<derived>
	^ concreteEntities
]

{ #category : #accessing }
FamixTConcreteParameterType >> concreteEntities: anObject [

	<generated>
	concreteEntities value: anObject
]

{ #category : #accessing }
FamixTConcreteParameterType >> generics [
	"Relation named: #generics type: #FamixTParameterConcretisation opposite: #concreteParameter"

	<generated>
	<FMComment: 'generic relationships, i.e. known genericParameter of this type.'>
	<derived>
	^ generics
]

{ #category : #accessing }
FamixTConcreteParameterType >> generics: anObject [

	<generated>
	generics value: anObject
]
