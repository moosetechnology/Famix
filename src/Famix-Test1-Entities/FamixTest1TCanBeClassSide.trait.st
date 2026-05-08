"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isClassSide` | `Boolean` | nil | Entity can be declared class side i.e. static|

"
Trait {
	#name : 'FamixTest1TCanBeClassSide',
	#instVars : [
		'#isClassSide => FMProperty'
	],
	#category : 'Famix-Test1-Entities-Traits',
	#package : 'Famix-Test1-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixTest1TCanBeClassSide classSide >> annotation [

	<FMClass: #TCanBeClassSide super: #Object>
	<package: #'Famix-Test1-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixTest1TCanBeClassSide >> isClassSide [

	<FMProperty: #isClassSide type: #Boolean>
	<generated>
	<FMComment: 'Entity can be declared class side i.e. static'>
	^ isClassSide
]

{ #category : 'accessing' }
FamixTest1TCanBeClassSide >> isClassSide: anObject [
	<generated>
	isClassSide := anObject
]
