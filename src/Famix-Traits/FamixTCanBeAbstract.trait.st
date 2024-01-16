"
## Properties
======================

- Named: #isAbstract Type: Boolean Comment: Entity can be declared abstract

"
Trait {
	#name : #FamixTCanBeAbstract,
	#instVars : [
		'#isAbstract => FMProperty'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTCanBeAbstract classSide >> annotation [

	<FMClass: #TCanBeAbstract super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
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
