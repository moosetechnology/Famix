"
## Relations
======================

### Other
- Relation: #myTrait Type: #FDTrait4 Opposite: #class1


"
Class {
	#name : #FDClass1,
	#superclass : #FDEntity,
	#traits : 'FDTrait3',
	#classTraits : 'FDTrait3 classTrait',
	#instVars : [
		'#myTrait => FMOne type: #FDTrait4 opposite: #class1'
	],
	#category : #'FamixDocumentor-TestMetaModel-Entities'
}

{ #category : #meta }
FDClass1 class >> annotation [

	<FMClass: #Class1 super: #FDEntity>
	<package: #'FamixDocumentor-TestMetaModel'>
	<generated>
	^ self
]

{ #category : #accessing }
FDClass1 >> myTrait [
	"Relation named: #myTrait type: #FDTrait4 opposite: #class1"

	<generated>
	^ myTrait
]

{ #category : #accessing }
FDClass1 >> myTrait: anObject [

	<generated>
	myTrait := anObject
]
