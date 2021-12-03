Trait {
	#name : #FamixJavaTCanBeClassSide,
	#instVars : [
		'#isClassSide => FMProperty'
	],
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTCanBeClassSide classSide >> annotation [

	<FMClass: #TCanBeClassSide super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #initialization }
FamixJavaTCanBeClassSide >> initialize [

	<generated>
	super initialize.

	"Default value initialization"
	isClassSide := false.

]

{ #category : #accessing }
FamixJavaTCanBeClassSide >> isClassSide [

	<FMProperty: #isClassSide type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Entity can be declared class side i.e. static'>
	^ isClassSide
]

{ #category : #accessing }
FamixJavaTCanBeClassSide >> isClassSide: anObject [
	<generated>
	isClassSide := anObject
]
