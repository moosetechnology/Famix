"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `myTrait` | `FDClass1` | `class1` | `FDTrait4` | |



"
Class {
	#name : 'FDClass1',
	#superclass : 'FDEntity',
	#traits : 'FDTrait3',
	#classTraits : 'FDTrait3 classTrait',
	#instVars : [
		'#myTrait => FMOne type: #FDTrait4 opposite: #class1'
	],
	#category : 'FamixDocumentor-TestMetaModel-Entities',
	#package : 'FamixDocumentor-TestMetaModel',
	#tag : 'Entities'
}

{ #category : 'meta' }
FDClass1 class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Class1 super: #FDEntity>
	<package: #'FamixDocumentor-TestMetaModel'>
	<generated>
]

{ #category : 'accessing' }
FDClass1 >> myTrait [
	"Relation named: #myTrait type: #FDTrait4 opposite: #class1"

	<ignoreForCoverage>
	<generated>
	^ myTrait
]

{ #category : 'accessing' }
FDClass1 >> myTrait: anObject [

	<ignoreForCoverage>
	<generated>
	myTrait := anObject
]
