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
	^self
]

{ #category : #accessing }
FamixTCanBeAbstract >> isAbstract [

	<FMProperty: #isAbstract type: #Boolean>
	<generated>
	<FMComment: 'Entity can be declared abstract'>
	^ isAbstract
]

{ #category : #accessing }
FamixTCanBeAbstract >> isAbstract: anObject [
	<generated>
	isAbstract := anObject
]
