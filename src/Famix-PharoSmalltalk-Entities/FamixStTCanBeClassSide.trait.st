Trait {
	#name : #FamixStTCanBeClassSide,
	#instVars : [
		'#isClassSide => FMProperty'
	],
	#category : #'Famix-PharoSmalltalk-Entities-Traits'
}

{ #category : #meta }
FamixStTCanBeClassSide classSide >> annotation [

	<FMClass: #TCanBeClassSide super: #Object>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixStTCanBeClassSide >> isClassSide [

	<FMProperty: #isClassSide type: #Boolean>
	<generated>
	<FMComment: 'Entity can be declared class side i.e. static'>
	^ isClassSide
]

{ #category : #accessing }
FamixStTCanBeClassSide >> isClassSide: anObject [
	<generated>
	isClassSide := anObject
]
