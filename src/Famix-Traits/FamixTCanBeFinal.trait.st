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
	^self
]

{ #category : #initialization }
FamixTCanBeFinal >> initialize [

	<generated>
	super initialize.

	"Default value initialization"
	isFinal := false.

]

{ #category : #accessing }
FamixTCanBeFinal >> isFinal [

	<FMProperty: #isFinal type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Entity can be declared final'>
	^ isFinal
]

{ #category : #accessing }
FamixTCanBeFinal >> isFinal: anObject [
	<generated>
	isFinal := anObject
]
