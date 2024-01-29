"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isFinal` | `Boolean` | false | Entity can be declared final|

"
Trait {
	#name : #FamixTCanBeFinal,
	#instVars : [
		'#isFinal => FMProperty'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTCanBeFinal classSide >> annotation [

	<FMClass: #TCanBeFinal super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTCanBeFinal >> isFinal [

	<FMProperty: #isFinal type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Entity can be declared final'>
	^ isFinal ifNil: [ isFinal := false ]
]

{ #category : #accessing }
FamixTCanBeFinal >> isFinal: anObject [
	<generated>
	isFinal := anObject
]
