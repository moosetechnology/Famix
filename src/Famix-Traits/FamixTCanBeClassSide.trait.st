Trait {
	#name : #FamixTCanBeClassSide,
	#instVars : [
		'#isClassSide => FMProperty defaultValue: false'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTCanBeClassSide classSide >> annotation [

	<FMClass: #TCanBeClassSide super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #initialization }
FamixTCanBeClassSide >> initialize [

	<generated>
	super initialize.

	"Default value initialization"
	isClassSide := false.

]

{ #category : #accessing }
FamixTCanBeClassSide >> isClassSide [

	<FMProperty: #isClassSide type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Entity can be declared class side i.e. static'>
	^ isClassSide
]

{ #category : #accessing }
FamixTCanBeClassSide >> isClassSide: anObject [
	<generated>
	isClassSide := anObject
]
