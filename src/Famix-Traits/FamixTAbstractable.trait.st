Trait {
	#name : #FamixTAbstractable,
	#instVars : [
		'#isAbstract => FMProperty'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTAbstractable classSide >> annotation [

	<FMClass: #TAbstractable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTAbstractable >> isAbstract [

	<FMProperty: #isAbstract type: #Boolean>
	<generated>
	<FMComment: 'Entity can be declared abstract'>
	^ isAbstract
]

{ #category : #accessing }
FamixTAbstractable >> isAbstract: anObject [
	<generated>
	isAbstract := anObject
]
