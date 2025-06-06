"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isAbstract` | `Boolean` | false | Entity can be declared abstract|

"
Trait {
	#name : #FamixTCanBeAbstract,
	#instVars : [
		'#isAbstract => FMProperty defaultValue: false'
	],
	#category : #'Famix-Traits-PrimitiveProperties'
}

{ #category : #meta }
FamixTCanBeAbstract classSide >> annotation [

	<FMClass: #TCanBeAbstract super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTCanBeAbstract >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTCanBeAbstract: self
]

{ #category : #accessing }
FamixTCanBeAbstract >> isAbstract [

	<FMProperty: #isAbstract type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Entity can be declared abstract'>
	^ isAbstract ifNil: [ isAbstract := false ]
]

{ #category : #accessing }
FamixTCanBeAbstract >> isAbstract: anObject [
	<generated>
	isAbstract := anObject
]
