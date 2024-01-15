"
## Relations
======================

### Other
- Relation: #class1 Type: #FDClass1 Opposite: #myTrait

## Properties
======================

- Named: #someProp Type: String Comment: A property in the trait
- Named: #otherProp Type: Object Comment: Another property in the trait

"
Trait {
	#name : #FDTrait4,
	#instVars : [
		'#class1 => FMMany type: #FDClass1 opposite: #myTrait',
		'#otherProp => FMProperty',
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
FDTrait4 >> addClass1: anObject [
	<generated>
	^ self class1 add: anObject
]

{ #category : #accessing }
FDTrait4 >> class1 [
	"Relation named: #class1 type: #FDClass1 opposite: #myTrait"

	<generated>
	<derived>
	^ class1
]

{ #category : #accessing }
FDTrait4 >> class1: anObject [

	<generated>
	class1 value: anObject
]

{ #category : #accessing }
FDTrait4 >> otherProp [

	<FMProperty: #otherProp type: #Object>
	<generated>
	<FMComment: 'Another property in the trait'>
	^ otherProp
]

{ #category : #accessing }
FDTrait4 >> otherProp: anObject [
	<generated>
	otherProp := anObject
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
