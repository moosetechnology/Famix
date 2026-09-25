"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `class1` | `FDTrait4` | `myTrait` | `FDClass1` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `otherProp` | `Object` | nil | Another property in the trait|
| `someProp` | `String` | nil | A property in the trait|

"
Trait {
	#name : 'FDTrait4',
	#instVars : [
		'#class1 => FMMany type: #FDClass1 opposite: #myTrait',
		'#otherProp => FMProperty',
		'#someProp => FMProperty'
	],
	#traits : 'FDTrait2',
	#classTraits : 'FDTrait2 classTrait',
	#category : 'FamixDocumentor-TestMetaModel-Traits',
	#package : 'FamixDocumentor-TestMetaModel',
	#tag : 'Traits'
}

{ #category : 'meta' }
FDTrait4 classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #Trait4 super: #Object>
	<package: #'FamixDocumentor-TestMetaModel'>
	<generated>
]

{ #category : 'adding' }
FDTrait4 >> addClass1: anObject [

	<ignoreForCoverage>
	<generated>
	^ self class1 add: anObject
]

{ #category : 'accessing' }
FDTrait4 >> class1 [
	"Relation named: #class1 type: #FDClass1 opposite: #myTrait"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ class1
]

{ #category : 'accessing' }
FDTrait4 >> class1: anObject [

	<ignoreForCoverage>
	<generated>
	class1 value: anObject
]

{ #category : 'accessing' }
FDTrait4 >> otherProp [

	<FMProperty: #otherProp type: #Object>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Another property in the trait'>
	^ otherProp
]

{ #category : 'accessing' }
FDTrait4 >> otherProp: anObject [
	<ignoreForCoverage>
	<generated>
	otherProp := anObject
]

{ #category : 'accessing' }
FDTrait4 >> someProp [

	<FMProperty: #someProp type: #String>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'A property in the trait'>
	^ someProp
]

{ #category : 'accessing' }
FDTrait4 >> someProp: anObject [
	<ignoreForCoverage>
	<generated>
	someProp := anObject
]
