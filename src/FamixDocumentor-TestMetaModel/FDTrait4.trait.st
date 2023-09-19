Trait {
	#name : #FDTrait4,
	#instVars : [
		'#classes1 => FMMany type: #FDClass1 opposite: #trait4',
		'#someProp => FMProperty'
	],
	#traits : 'FDTrait2',
	#classTraits : 'FDTrait2 classTrait',
	#category : #'FamixDocumentor-TestMetaModel-Traits'
}

{ #category : #meta }
FDTrait4 classSide >> annotation [

	<FMClass: #Trait4 super: #Object>
	<package: #'FamixDocumentor-TestMetaModel'>
	<generated>
	^ self
]

{ #category : #adding }
FDTrait4 >> addClasses1: anObject [
	<generated>
	^ self classes1 add: anObject
]

{ #category : #accessing }
FDTrait4 >> classes1 [
	"Relation named: #classes1 type: #FDClass1 opposite: #trait4"

	<generated>
	<derived>
	^ classes1
]

{ #category : #accessing }
FDTrait4 >> classes1: anObject [

	<generated>
	classes1 value: anObject
]

{ #category : #accessing }
FDTrait4 >> someProp [

	<FMProperty: #someProp type: #String>
	<generated>
	<FMComment: 'A property in the trait'>
	^ someProp
]

{ #category : #accessing }
FDTrait4 >> someProp: anObject [
	<generated>
	someProp := anObject
]
