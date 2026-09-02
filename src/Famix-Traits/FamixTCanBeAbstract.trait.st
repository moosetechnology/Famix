"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isAbstract` | `Boolean` | false | Entity can be declared abstract|

"
Trait {
	#name : 'FamixTCanBeAbstract',
	#instVars : [
		'#isAbstract => FMProperty defaultValue: false'
	],
	#category : 'Famix-Traits-PrimitiveProperties',
	#package : 'Famix-Traits',
	#tag : 'PrimitiveProperties'
}

{ #category : 'meta' }
FamixTCanBeAbstract classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TCanBeAbstract super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTCanBeAbstract >> isAbstract [

	<FMProperty: #isAbstract type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Entity can be declared abstract'>
	^ isAbstract ifNil: [ isAbstract := false ]
]

{ #category : 'accessing' }
FamixTCanBeAbstract >> isAbstract: anObject [
	<ignoreForCoverage>
	<generated>
	isAbstract := anObject
]
