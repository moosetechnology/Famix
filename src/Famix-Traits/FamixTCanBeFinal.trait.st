"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isFinal` | `Boolean` | false | Entity can be declared final|

"
Trait {
	#name : 'FamixTCanBeFinal',
	#instVars : [
		'#isFinal => FMProperty defaultValue: false'
	],
	#category : 'Famix-Traits-PrimitiveProperties',
	#package : 'Famix-Traits',
	#tag : 'PrimitiveProperties'
}

{ #category : 'meta' }
FamixTCanBeFinal classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TCanBeFinal super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTCanBeFinal >> isFinal [

	<FMProperty: #isFinal type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Entity can be declared final'>
	^ isFinal ifNil: [ isFinal := false ]
]

{ #category : 'accessing' }
FamixTCanBeFinal >> isFinal: anObject [
	<ignoreForCoverage>
	<generated>
	isFinal := anObject
]
