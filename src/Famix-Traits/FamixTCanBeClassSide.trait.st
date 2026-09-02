"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isClassSide` | `Boolean` | false | Entity can be declared class side i.e. static|

"
Trait {
	#name : 'FamixTCanBeClassSide',
	#instVars : [
		'#isClassSide => FMProperty defaultValue: false'
	],
	#category : 'Famix-Traits-PrimitiveProperties',
	#package : 'Famix-Traits',
	#tag : 'PrimitiveProperties'
}

{ #category : 'meta' }
FamixTCanBeClassSide classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TCanBeClassSide super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTCanBeClassSide >> isClassSide [

	<FMProperty: #isClassSide type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Entity can be declared class side i.e. static'>
	^ isClassSide ifNil: [ isClassSide := false ]
]

{ #category : 'accessing' }
FamixTCanBeClassSide >> isClassSide: anObject [
	<ignoreForCoverage>
	<generated>
	isClassSide := anObject
]
