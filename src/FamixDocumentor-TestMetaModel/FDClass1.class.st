Class {
	#name : #FDClass1,
	#superclass : #FDEntity,
	#traits : 'FDTrait3',
	#classTraits : 'FDTrait3 classTrait',
	#instVars : [
		'#trait4 => FMOne type: #FDTrait4 opposite: #classes1'
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
FDClass1 >> trait4 [
	"Relation named: #trait4 type: #FDTrait4 opposite: #classes1"

	<generated>
	^ trait4
]

{ #category : #accessing }
FDClass1 >> trait4: anObject [

	<generated>
	trait4 := anObject
]
